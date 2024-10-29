import 'package:f2/constants.dart';
import 'package:f2/widgets/dosage_button.dart';
import 'package:flutter/material.dart';

import '../final_medicines_screen.dart';

class MedicineDosageScreen extends StatefulWidget {
  const MedicineDosageScreen({super.key});

  @override
  State<MedicineDosageScreen> createState() => _MedicineDosageScreenState();
}

class _MedicineDosageScreenState extends State<MedicineDosageScreen> {
  String medicineTime = 'na';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Image(
                    height: 64,
                    width: 80,
                    image: AssetImage('assets/images/ministry-of-ayush.png'),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Ayush Hospitals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              // Center(
              //   child: DataTable(
              //     dividerThickness: 0,
              //     columnSpacing: 15,
              //     horizontalMargin: 10,
              //     headingTextStyle: const TextStyle(
              //         color: kBlackColor,
              //         fontWeight: FontWeight.w700,
              //         fontFamily: "Poppins",
              //         fontSize: 14 // Text color
              //     ),
              //     dataTextStyle: const TextStyle(
              //         color: kBlackColor,
              //         fontFamily: "Poppins",
              //         fontSize: 14 // Text color
              //     ),
              //     columns: const <DataColumn>[
              //       DataColumn(
              //           label: Text(
              //             'Medicine \nName',
              //             textAlign: TextAlign.center,
              //           )),
              //       DataColumn(
              //           label: Text(
              //             'Quantity',
              //             textAlign: TextAlign.center,
              //           )),
              //       DataColumn(
              //           label: Text(
              //             'Unit',
              //             textAlign: TextAlign.center,
              //           )),
              //       DataColumn(
              //           label: Text(
              //             'No. Of Days',
              //             textAlign: TextAlign.center,
              //           )),
              //     ],
              //     rows: widget.selectedMedicineList
              //         .map(
              //           (data) => DataRow(
              //         cells: <DataCell>[
              //           DataCell(Text(data['medicineName']!)),
              //           DataCell(
              //             Center(
              //               child: DropdownButton<String>(
              //                 icon: const SizedBox(),
              //                 value: selectedQuantity,
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     selectedQuantity = newValue!;
              //                   });
              //                 },
              //                 items: quantity.map((String option) {
              //                   return DropdownMenuItem<String>(
              //                     value: option,
              //                     child: Text(option),
              //                   );
              //                 }).toList(),
              //               ),
              //             ),
              //           ),
              //           DataCell(
              //             Center(
              //               child: DropdownButton<String>(
              //                 icon: const SizedBox(),
              //                 value: selectedUnit,
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     selectedUnit = newValue!;
              //                   });
              //                 },
              //                 items: unit.map((String option) {
              //                   return DropdownMenuItem<String>(
              //                     value: option,
              //                     child: Text(option),
              //                   );
              //                 }).toList(),
              //               ),
              //             ),
              //           ),
              //           DataCell(
              //             Center(
              //               child: DropdownButton<String>(
              //                 icon: const SizedBox(),
              //                 value: selectedNoOfDays,
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     selectedNoOfDays = newValue!;
              //                   });
              //                 },
              //                 items: noOfDays.map((String option) {
              //                   return DropdownMenuItem<String>(
              //                     value: option,
              //                     child: Text(option),
              //                   );
              //                 }).toList(),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //         .toList(),
              //   ),
              // )
              // ,
              const SizedBox(
                height: 18,
              ),
              DosageButton(
                onChanged: () {
                  setState(() {
                    medicineTime = medicineTime == "na"
                        ? "beforeFood"
                        : medicineTime == "beforeFood"
                            ? "afterFood"
                            : "na";
                  });
                },
                iconChangeTo: medicineTime,
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FinalMedicinesScreen(
                                isDoctor: true,
                              )),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Change the radius value as needed
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontFamily: "Poppins",
                          fontSize: 20 // Text color
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
