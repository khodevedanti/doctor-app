import 'package:dropdown_search/dropdown_search.dart';
import 'package:f2/constants.dart';
import 'package:f2/screens/final_medicines_screen.dart';
import 'package:f2/widgets/custom_drop_down_search.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class MedicineQuantityScreen extends StatefulWidget {
  const MedicineQuantityScreen({super.key});

  @override
  State<MedicineQuantityScreen> createState() => _MedicineQuantityScreenState();
}

class _MedicineQuantityScreenState extends State<MedicineQuantityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              // const InputQty(
              //     decoration: QtyDecorationProps(
              //         isBordered: false,
              //         borderShape: BorderShapeBtn.circle,
              //         width: 12)),

              const SizedBox(
                height: 18,
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FinalMedicinesScreen()),
                    ),
                    style: ButtonStyle(
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Change the radius value as needed
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(kPrimaryColor),
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
