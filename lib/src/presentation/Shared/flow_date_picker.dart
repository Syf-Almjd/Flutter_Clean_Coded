import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';

class DatePickerWidget extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;

  const DatePickerWidget(
      {required this.labeltext, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        return null;
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            currentDate: DateTime.now(),
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100));
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      readOnly: true,
      controller: controller,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: AppColors.appBarColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: labeltext,
          labelStyle: const TextStyle(
              color: AppColors.darkColor, fontSize: AppFontSize.s12)),
      style: const TextStyle(
          color: AppColors.primaryColor, fontSize: AppFontSize.s12),
    );
  }
}
