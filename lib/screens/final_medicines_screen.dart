import 'package:f2/constants.dart';
import 'package:flutter/material.dart';

class FinalMedicinesScreen extends StatelessWidget {
  const FinalMedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Table(
                  defaultColumnWidth: FixedColumnWidth(size.width * 0.23),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015),
                          child: const Text(
                            'Medicine name',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015),
                          child: const Text(
                            'Quantity',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015),
                          child: const Text(
                            'Dosage',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015),
                          child: const Text(
                            'Price',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )),
                    ]),
                    TableRow(children: [
                      Text(
                        '\n1\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: size.width * 0.035),
                      ),
                      Text(
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: size.width * 0.035),
                      ),
                      Text(
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: size.width * 0.035),
                      ),
                      Text(
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: size.width * 0.035),
                      )
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
