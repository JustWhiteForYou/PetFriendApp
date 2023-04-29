import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(dynamic value)? validator;

  const CustomTextFormField({
    super.key,
    this.labelText,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        ),
      ),
    );
  }
}
