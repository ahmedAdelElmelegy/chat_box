import 'package:chat_app/features/Calls/presentation/view/widgets/CallsViewBody.dart';
import 'package:flutter/material.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: CallViewBody(),
    );
  }
}
