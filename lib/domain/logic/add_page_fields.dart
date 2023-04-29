import 'package:flutter/material.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';

class AddFields extends StatelessWidget {
  final TextEditingController breedController;
  final TextEditingController dateController;
  final TextEditingController colorController;
  final TextEditingController descriptionController;

  const AddFields({
    Key? key,
    required this.breedController,
    required this.dateController,
    required this.colorController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFormField(
          labelText: 'Breed',
          controller: breedController,
          prefixIcon: Icons.pets_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        CustomTextFormField(
          labelText: 'Date',
          controller: dateController,
          prefixIcon: Icons.calendar_month_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        CustomTextFormField(
          labelText: 'Color',
          controller: colorController,
          prefixIcon: Icons.color_lens_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        CustomTextFormField(
          labelText: 'Description',
          controller: descriptionController,
          prefixIcon: Icons.comment_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
      ],
    );
  }
}
