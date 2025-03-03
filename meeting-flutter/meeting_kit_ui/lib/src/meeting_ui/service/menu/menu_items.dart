// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

part of meeting_ui;

/// 开发者自定义的注入菜单ID应该大于等于该值，小于该值的菜单为SDK内置菜单。
/// SDK内置的菜单点击时不会触发回调，只有自定义菜单才会回调。
const int firstInjectableMenuId = 100;

/// SDK内置菜单，需要与平台定义的ID值保持一致
/// Note: 如果修改ID值，请同步修改平台上的定义
class NEMenuIDs {
  /// 以下菜单不能包含在Toolbar菜单中
  static const Set<int> toolbarExcludes = {};

  /// 以下菜单不能包含在更多菜单中
  static const Set<int> moreExcludes = {
    microphone,
    camera,
    managerParticipants,
    participants,
  };

  static const Set<int> all = {
    microphone,
    camera,
    screenShare,
    participants,
    managerParticipants,
    invitation,
    chatroom,
    whiteBoard,
  };

  /// 内置"音频"菜单ID，使用该ID的菜单可添加至Toolbar菜单列表中的任意位置。
  static const int microphone = 0;

  /// 内置"视频"菜单ID，使用该ID的菜单可添加至Toolbar菜单列表中的任意位置。
  static const int camera = 1;

  /// 内置"共享屏幕"菜单ID，使用该ID的菜单可添加至Toolbar菜单列表中的任意位置。
  static const int screenShare = 2;

  /// 内置"参会者"菜单ID，使用该ID的菜单可添加至Toolbar菜单列表中的任意位置。
  static const int participants = 3;

  /// 内置"管理参会者"菜单ID，使用该ID的菜单可添加至Toolbar菜单列表中的任意位置。
  static const int managerParticipants = 4;

  /// 内置"更多"菜单ID，使用该ID的菜单可添加至Toolbar菜单列表中的任意位置。
  // static const int MORE_MENU_ID = 5;

  static const int switchShowType = 6;

  /// 内置"邀请"菜单ID，使用该ID的菜单可添加至"更多"菜单列表中的任意位置。
  static const int invitation = 20;

  /// 内置"聊天"菜单ID，使用该ID的菜单可添加至"更多"菜单列表中的任意位置。
  static const int chatroom = 21;

  /// 内置"白板"菜单ID，使用该ID的菜单可添加至"更多"菜单列表中的任意位置。
  static const int whiteBoard = 22;
}

class NEMenuItems {
  static List<NEMeetingMenuItem> get defaultToolbarMenuItems => [
        microphone,
        camera,
        screenShare,
        participants,
        managerParticipants,
      ];

  static List<NEMeetingMenuItem> get defaultMoreMenuItems => [
        invitation,
        chatroom,
        whiteBoard,
      ];

  static final NEMeetingMenuItem microphone = NECheckableMenuItem(
    itemId: NEMenuIDs.microphone,
    visibility: NEMenuVisibility.visibleAlways,
    uncheckStateItem: NEMenuItemInfo.undefine,
    checkedStateItem: NEMenuItemInfo.undefine,
  );

  static final NEMeetingMenuItem camera = NECheckableMenuItem(
    itemId: NEMenuIDs.camera,
    visibility: NEMenuVisibility.visibleAlways,
    uncheckStateItem: NEMenuItemInfo.undefine,
    checkedStateItem: NEMenuItemInfo.undefine,
  );

  static final NEMeetingMenuItem screenShare = NECheckableMenuItem(
    itemId: NEMenuIDs.screenShare,
    visibility: NEMenuVisibility.visibleAlways,
    uncheckStateItem: NEMenuItemInfo.undefine,
    checkedStateItem: NEMenuItemInfo.undefine,
  );

  static final NEMeetingMenuItem participants = NESingleStateMenuItem(
    itemId: NEMenuIDs.participants,
    visibility: NEMenuVisibility.visibleExcludeHost,
    singleStateItem: NEMenuItemInfo.undefine,
  );

  static final NEMeetingMenuItem managerParticipants = NESingleStateMenuItem(
    itemId: NEMenuIDs.managerParticipants,
    visibility: NEMenuVisibility.visibleToHostOnly,
    singleStateItem: NEMenuItemInfo.undefine,
  );

  // static const NEMeetingMenuItem MORE_MENU = NESingleStateMenuItem(
  //     itemId: NEMenuIDs.MORE_MENU_ID,
  //     visibility: NEMenuVisibility.visibleAlways,
  //     singleStateItem: NEMenuItemInfo("更多"));

  static final NEMeetingMenuItem invitation = NESingleStateMenuItem(
    itemId: NEMenuIDs.invitation,
    visibility: NEMenuVisibility.visibleAlways,
    singleStateItem: NEMenuItemInfo.undefine,
  );

  static final NEMeetingMenuItem chatroom = NESingleStateMenuItem(
    itemId: NEMenuIDs.chatroom,
    visibility: NEMenuVisibility.visibleAlways,
    singleStateItem: NEMenuItemInfo.undefine,
  );

  /// 白板菜单
  static final whiteBoard = NECheckableMenuItem(
    itemId: NEMenuIDs.whiteBoard,
    visibility: NEMenuVisibility.visibleAlways,
    uncheckStateItem: NEMenuItemInfo.undefine,
    checkedStateItem: NEMenuItemInfo.undefine,
  );
}
