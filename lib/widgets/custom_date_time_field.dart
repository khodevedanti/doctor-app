import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:f2/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTimeField extends StatelessWidget {
  CustomDateTimeField(
      {super.key,
      required this.dateFieldText,
      required this.dateController,
      required this.timeRequired});

  final format = DateFormat("yyyy-MM-dd");
  final String dateFieldText;
  final TextEditingController dateController;
  final bool timeRequired;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      controller: dateController,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        errorStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "Poppins",
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 3,
            color: kRedColor,
          ),
        ),
        fillColor: kBgColor,
        border: InputBorder.none,
        hintText: dateFieldText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xFF555555),
          fontFamily: "Poppins",
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: kPrimaryColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
        ),
      ),
      format: format,
      onShowPicker: (context, currentValue) async {
        return await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        ).then((DateTime? date) async {
          if (timeRequired == true) {
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          } else {
            currentValue = date;
            return currentValue;
          }
        });
      },
    );
  }
}
