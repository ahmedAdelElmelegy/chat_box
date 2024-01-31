import 'package:chat_app/features/settings/presentation/view/widgets/SettingViewBody.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SettingsViewBody(),
    );
  }
}
