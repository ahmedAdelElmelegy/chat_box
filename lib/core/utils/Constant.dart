import 'package:chat_app/core/models/Settings_model.dart';
import 'package:chat_app/core/utils/Assets.dart';
import 'package:flutter_svg/svg.dart';

class Constants {
  static List<SettingsModel> item = [
    SettingsModel(
        icon: SvgPicture.asset(Assets.key),
        title: "Account",
        subtitle: 'Privacy, security, change number'),
    SettingsModel(
        icon: SvgPicture.asset(Assets.message),
        title: "Chat",
        subtitle: 'Chat history,theme,wallpapers'),
    SettingsModel(
        icon: SvgPicture.asset(Assets.notification),
        title: "Notifications",
        subtitle: 'Messages, group and others'),
    SettingsModel(
        icon: SvgPicture.asset(Assets.help),
        title: "Help",
        subtitle: 'Help center,contact us, privacy policy'),
    SettingsModel(
        icon: SvgPicture.asset(Assets.data),
        title: "Storage and data",
        subtitle: 'Network usage, stogare usage'),
    SettingsModel(
        icon: SvgPicture.asset(Assets.users),
        title: "Invite a friend",
        subtitle: ''),
  ];
  static String? userId;
}
