import 'package:flutter/material.dart';

import '../clean_code_tools/clean_code_tools.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  final bool isHiddenPassword;
  final ValueChanged<bool> togglePasswordView;

  const PasswordTextField({
    Key? key,
    required this.passwordController,
    required this.isHiddenPassword,
    required this.togglePasswordView,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: myEdgeIns,
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: widget.isHiddenPassword,
        validator: (value) =>
            value != null && value.length < 6 ? 'Min 6 symbols' : null,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: () => widget.togglePasswordView(!widget.isHiddenPassword),
            child: Icon(
              widget.isHiddenPassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          ),
          labelText: ("password"),
        ),
      ),
    );
  }
}
