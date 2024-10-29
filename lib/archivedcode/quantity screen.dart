// import 'package:f2/constants.dart';
// import 'package:f2/screens/doctor_screens/medicine_dosage_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../../dummy_data.dart';
//
// class MedicineQuantityScreen extends StatefulWidget {
//   const MedicineQuantityScreen({super.key, required this.selectedMedicineList});
//
//   final List<Map<String, String>> selectedMedicineList;
//
//   @override
//   State<MedicineQuantityScreen> createState() => _MedicineQuantityScreenState();
// }
//
// class _MedicineQuantityScreenState extends State<MedicineQuantityScreen> {
//   String selectedQuantity = '10';
//   String selectedUnit = 'gm';
//   String selectedNoOfDays = '5';
//
//   List<String> quantity = ['10', '20', '30', '40'];
//   List<String> unit = [
//     'gm',
//     'ml',
//   ];
//   List<String> noOfDays = ['5', '10', '15', '30', '60'];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   String getCodeForMedicine(String medicineName) {
//     for (var data in dummyMedicineData) {
//       for (var medicineData in data) {
//         if (medicineData['MEDICINES'] == medicineName) {
//           return medicineData['CODE'] ??
//               ''; // Provide a default value if 'CODE' is not found
//         }
//       }
//     }
//     return ''; // Return an empty string if the medicine is not found
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print(widget.selectedMedicineList);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: kWhiteColor,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Row(
//                 children: [
//                   Image(
//                     height: 64,
//                     width: 80,
//                     image: AssetImage('assets/images/ministry-of-ayush.png'),
//                   ),
//                   SizedBox(
//                     width: 18,
//                   ),
//                   Text(
//                     'Ayush Hospitals',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: kPrimaryColor,
//                       fontSize: 30,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                       height: 0,
//                     ),
//                   ),
//                 ],
//               ),
//               Center(
//                 child: DataTable(
//                   dividerThickness: 0,
//                   columnSpacing: 15,
//                   horizontalMargin: 10,
//                   headingTextStyle: const TextStyle(
//                       color: kBlackColor,
//                       fontWeight: FontWeight.w700,
//                       fontFamily: "Poppins",
//                       fontSize: 14 // Text color
//                   ),
//                   dataTextStyle: const TextStyle(
//                       color: kBlackColor,
//                       fontFamily: "Poppins",
//                       fontSize: 14 // Text color
//                   ),
//                   columns: const <DataColumn>[
//                     DataColumn(
//                         label: Text(
//                           'Medicine \nName',
//                           style: TextStyle(fontSize: 12),
//                           textAlign: TextAlign.center,
//                         )),
//                     DataColumn(
//                         label: Text(
//                           'Quantity',
//                           style: TextStyle(fontSize: 12),
//                           textAlign: TextAlign.center,
//                         )),
//                     DataColumn(
//                         label: Text(
//                           'Unit',
//                           style: TextStyle(fontSize: 12),
//                           textAlign: TextAlign.center,
//                         )),
//                     DataColumn(
//                         label: Text(
//                           'No. of Days',
//                           style: TextStyle(fontSize: 12),
//                           textAlign: TextAlign.center,
//                         )),
//                   ],
//                   rows: widget.selectedMedicineList
//                       .map(
//                         (data) => DataRow(
//                       cells: <DataCell>[
//                         DataCell(Text(data['medicineName']!)),
//                         DataCell(
//                           Center(
//                             child: DropdownButton<String>(
//                               icon: const SizedBox(),
//                               value: selectedQuantity,
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectedQuantity = newValue!;
//                                 });
//                               },
//                               items: quantity.map((String option) {
//                                 return DropdownMenuItem<String>(
//                                   value: option,
//                                   child: Text(option),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                         DataCell(
//                           Center(
//                             child: DropdownButton<String>(
//                               icon: const SizedBox(),
//                               value: selectedUnit,
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectedUnit = newValue!;
//                                 });
//                               },
//                               items: unit.map((String option) {
//                                 return DropdownMenuItem<String>(
//                                   value: option,
//                                   child: Text(option),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                         DataCell(
//                           Center(
//                             child: DropdownButton<String>(
//                               icon: const SizedBox(),
//                               value: selectedNoOfDays,
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectedNoOfDays = newValue!;
//                                 });
//                               },
//                               items: noOfDays.map((String option) {
//                                 return DropdownMenuItem<String>(
//                                   value: option,
//                                   child: Text(option),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       .toList(),
//                 ),
//               )
//               // const InputQty(
//               //     decoration: QtyDecorationProps(
//               //         isBordered: false,
//               //         borderShape: BorderShapeBtn.circle,
//               //         width: 12)),
//               ,
//               const SizedBox(
//                 height: 18,
//               ),
//               const Spacer(),
//               Center(
//                 child: SizedBox(
//                   width: 150,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () => Navigator.of(context).push(
//                       MaterialPageRoute(
//                           builder: (context) => const MedicineDosageScreen()),
//                     ),
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                               10.0), // Change the radius value as needed
//                         ),
//                       ),
//                       backgroundColor: MaterialStateProperty.all(kPrimaryColor),
//                     ),
//                     child: const Text(
//                       'OK',
//                       style: TextStyle(
//                           color: kWhiteColor,
//                           fontFamily: "Poppins",
//                           fontSize: 20 // Text color
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
