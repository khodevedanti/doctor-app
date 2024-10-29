import 'package:f2/constants.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key, required this.textName, required this.textResponse});

  final String textName;
  final String textResponse;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$textName: ',
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
            color: kBlackColor),
        children: <TextSpan>[
          TextSpan(
            text: textResponse,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                color: kBlackColor),
          ),
        ],
      ),
    );
  }
}
