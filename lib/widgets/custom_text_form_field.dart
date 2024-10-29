import 'package:flutter/material.dart';

import '../constants.dart';

class CustomizedTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  // final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final dynamic keyboardType;

  const CustomizedTextFormField(
      {Key? key,
        required this.hintText,
        required this.obscureText,
        // required this.validator,
        this.onSaved,
        this.onFieldSubmitted,
        this.controller,
        required this.readOnly,
        this.keyboardType,
        this.onChanged})
      : super(key: key);

  @override
  _CustomizedTextFormFieldState createState() =>
      _CustomizedTextFormFieldState();
}

class _CustomizedTextFormFieldState extends State<CustomizedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(

        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        controller: widget.controller,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        // textInputAction: TextInputAction.done,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        // validator: widget.validator,
        // style: const TextStyle(fontSize: 18.0),
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
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
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 3,
              color: Colors.blue,
            ),
          ),
          fillColor: kGreyColor,
          border: InputBorder.none,
          hintText: widget.hintText,
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
              color:Colors.transparent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}