import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  String? selectedValue;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

   CustomDropDown({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue!.isEmpty ? null : widget.selectedValue,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.controller.text = newValue!;
          widget.selectedValue = newValue;
        });
        widget.onChanged(newValue!);
      },
    );
  }
}
