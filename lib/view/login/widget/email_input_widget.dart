import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const EmailInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'User Name',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
