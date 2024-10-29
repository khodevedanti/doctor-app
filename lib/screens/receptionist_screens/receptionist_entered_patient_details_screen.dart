import 'package:f2/constants.dart';
import 'package:f2/screens/doctor_screens/medicine_quantity_screen.dart';
import 'package:f2/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ReceptionistEnteredPatientDetailsScreen extends StatefulWidget {
  const ReceptionistEnteredPatientDetailsScreen(
      {super.key,
      required this.name,
      required this.gender,
      required this.age,
      required this.phoneNo,
      required this.date,
      required this.weight});

  final String name;
  final String gender;
  final String age;
  final String phoneNo;
  final String date;
  final String weight;

  @override
  State<ReceptionistEnteredPatientDetailsScreen> createState() =>
      _ReceptionistEnteredPatientDetailsScreenState();
}

class _ReceptionistEnteredPatientDetailsScreenState
    extends State<ReceptionistEnteredPatientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  CustomRichText(
                    textName: 'Name',
                    textResponse: widget.name,
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  CustomRichText(
                    textName: 'Date',
                    textResponse: widget.date,
                  ),
                ],
              ),
              CustomRichText(
                textName: 'Age',
                textResponse: widget.age,
              ),
              CustomRichText(
                textName: 'Gender',
                textResponse: widget.gender,
              ),
              CustomRichText(
                textName: 'Weight',
                textResponse: widget.weight,
              ),
              CustomRichText(
                textName: 'Phone No. ',
                textResponse: widget.phoneNo,
              ),
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
                          builder: (context) => const MedicineQuantityScreen()),
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
