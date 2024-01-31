import 'package:chat_app/features/contacts/presentation/view/widgets/ContactsViewBody.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: ContactViewbody(),
    );
  }
}
