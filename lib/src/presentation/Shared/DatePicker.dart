import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
 final String labeltext;
  final TextEditingController controller;

  const DatePickerWidget(
      {required this.labeltext, required this.controller, super.key});


  @override
  Widget build(BuildContext context) {
    return
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is empty';
                }
                return null;
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1910),
                    lastDate: DateTime(2025));
                if(pickedDate!=null){
                  String formattedDate=DateFormat('yyyy-MM-dd').format(pickedDate);
                  controller.text=formattedDate;
                }
              },
              readOnly: true,
              controller: controller,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white12,

                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))),
                  errorBorder: const OutlineInputBorder(

                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))),
                  labelText: labeltext,
                  labelStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),

            ),
    );
  }
}
