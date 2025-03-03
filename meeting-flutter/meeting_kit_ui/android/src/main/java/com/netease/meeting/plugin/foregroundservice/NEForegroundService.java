// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

package com.netease.meeting.plugin.foregroundservice;

import android.app.Notification;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.IBinder;
import android.os.Process;
import android.util.Log;
import java.util.Map;

public class NEForegroundService extends Service {

  public static final int ONGOING_NOTIFICATION_ID = 0x9527;

  private static ForegroundServiceConfig foregroundServiceConfig;

  static ForegroundServiceConfig getForegroundServiceConfig() {
    return foregroundServiceConfig;
  }

  public static void start(Context context, Map config) {
    ForegroundServiceConfig fsc = ForegroundServiceConfig.fromMap(config);
    if (fsc == null) {
      return;
    }
    foregroundServiceConfig = fsc;
    if (NENotificationManager.getInstance().ensureNotification(context) == null) {
      Log.i("NEForegroundService", "ensure notification fail, ignore start service.");
      return;
    }
    try {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        Log.e("NEForegroundService", "startForegroundService");
        context.startForegroundService(new Intent(context, NEForegroundService.class));
      } else {
        Log.e("NEForegroundService", "startService");
        context.startService(new Intent(context, NEForegroundService.class));
      }
    } catch (Throwable throwable) {
      Log.e("NEForegroundService", "startService error", throwable);
    }
  }

  public static void cancel(Context context) {
    // stopService may throw remoteException.
    //
    // if the service had been started as foreground, but
    // being brought down before actually showing a notification.
    // That is not allowed.
    try {
      context.stopService(new Intent(context, NEForegroundService.class));
      NENotificationManager.getInstance().cancelNotification(context, ONGOING_NOTIFICATION_ID);
    } catch (Exception e) {
      Log.e("NEForegroundService", "cancel foreground service error", e);
    }
  }

  @Override
  public void onCreate() {
    Log.i("NEForegroundService", "onCreate");
    super.onCreate();
  }

  @Override
  public int onStartCommand(Intent intent, int flags, int startId) {
    Log.i("NEForegroundService", "onStartCommand");
    onStartForeground();
    super.onStartCommand(intent, flags, startId);
    return START_NOT_STICKY;
  }

  private void onStartForeground() {
    Notification notification = NENotificationManager.getInstance().getNotification();
    if (notification == null) {
      Log.i("NEForegroundService", "onStartForeground without notification");
      return;
    }
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      startForeground(
          ONGOING_NOTIFICATION_ID,
          notification,
          ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION);
    } else {
      startForeground(ONGOING_NOTIFICATION_ID, notification);
    }

    Log.i("NEForegroundService", "onStartForeground");
  }

  @Override
  public IBinder onBind(Intent intent) {
    return null;
  }

  @Override
  public void onTaskRemoved(Intent rootIntent) {
    super.onTaskRemoved(rootIntent);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      Log.i("NEForegroundService", "kill self due to task removed!");
      //quit application
      stopSelf();
      android.os.Process.killProcess(Process.myPid());
      System.exit(0);
    }
  }
}
