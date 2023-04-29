import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../clean_code_tools/clean_code_tools.dart';

class TextFieldEmailForm extends StatelessWidget {
  const TextFieldEmailForm({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: myEdgeIns,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        validator: (email) =>
        email?.isNotEmpty == true && !EmailValidator.validate(email!)
            ? 'Wrong type of email'
            : null,
        decoration: const InputDecoration(
          labelText: "email",
        ),
      ),
    );
  }
}