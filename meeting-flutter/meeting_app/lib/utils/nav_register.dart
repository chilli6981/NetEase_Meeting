// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:nemeeting/about/about.dart';
import 'package:nemeeting/meeting/history_meeting.dart';
import 'package:nemeeting/meeting/meeting_create.dart';
import 'package:nemeeting/meeting/meeting_join.dart';
import 'package:nemeeting/pre_meeting/schedule_meeting.dart';
import 'package:nemeeting/routes/auth/check_mobile.dart';
import 'package:nemeeting/routes/auth/get_mobile_check_code.dart';
import 'package:nemeeting/routes/auth/password_verify.dart';
import 'package:nemeeting/routes/backdoor.dart';
import 'package:nemeeting/routes/entrance.dart';
import 'package:nemeeting/routes/home_page.dart';
// import 'package:nemeeting/setting/company_setting.dart';
import '../routes/auth/login.dart';
import '../uikit/utils/router_name.dart';
import 'package:nemeeting/routes/auth/register_user_info.dart';
import 'package:nemeeting/setting/meeting_setting.dart';
import 'package:nemeeting/setting/nick_setting.dart';

class RoutesRegister {
  static var routes = {
    RouterName.login: (context) => LoginRoute(),
    RouterName.getMobileCheckCode: (context) => GetMobileCheckCodeRoute(),
    RouterName.checkMobile: (context) => CheckMobileRoute(),
    RouterName.registerUserInfo: (context) => RegisterUserInfoRoute(),
    RouterName.passwordVerify: (context) => PasswordVerifyRoute(),
    //RouterName.oldPasswordVerify: (context) => OldPasswordVerifyRoute(),
    // RouterName.anonyMeetJoin: (context) => AnonyMeetJoinRoute(),
    RouterName.entrance: (context) => EntranceRoute(),
    RouterName.homePage: (context) => HomePageRoute(),
    RouterName.meetCreate: (context) => MeetCreateRoute(),
    RouterName.meetJoin: (context) => MeetJoinRoute(),
    RouterName.historyMeet: (context) => HistoryMeetingRoute(),
    RouterName.meetingSetting: (context) => MeetingSetting(),
    // RouterName.personalSetting: (context) => PersonalSetting(),
    // RouterName.companySetting: (context) => CompanySetting(),
    RouterName.nickSetting: (context) => NickSetting(),
    RouterName.backdoor: (context) => BackdoorRoute(),
    RouterName.about: (context) => About(),
    RouterName.scheduleMeeting: (context) => ScheduleMeetingRoute(),
  };

  static MaterialPageRoute getPageRoute(
      String routeName, BuildContext context) {
    var builder = routes[routeName];
    if (builder == null) {
      throw Exception('Invalid route name: $routeName');
    }
    return MaterialPageRoute(builder: (context) => builder(context));
  }
}
