import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f2/constants.dart';
import 'package:f2/screens/final_medicines_screen.dart';
import 'package:f2/screens/doctor_screens/medicine_search_screen.dart';
import 'package:f2/widgets/custom_date_time_field.dart';
import 'package:f2/widgets/custom_text_form_field.dart';
import 'package:f2/screens/receptionist_screens/receptionist_entered_patient_details_screen.dart';
import 'package:flutter/material.dart';

class EnterPatientDetails extends StatefulWidget {
  const EnterPatientDetails({super.key});

  @override
  State<EnterPatientDetails> createState() => _EnterPatientDetailsState();
}

class _EnterPatientDetailsState extends State<EnterPatientDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> gender = [
    'Male',
    'Female',
    'Others',
  ];
  TextEditingController nameController = TextEditingController();
  String selectedGender = "";
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();

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
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Enter patient details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              CustomizedTextFormField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
                readOnly: false,
              ),
              const SizedBox(
                height: 27,
              ),
              SizedBox(
                height: 50,
                child: DropdownButtonFormField2(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: kBgColor,
                    isDense: false,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 2,
                        color: kPrimaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Gender',
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Poppins", color: kGreyColor),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: kPrimaryColor,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  selectedItemHighlightColor: kPrimaryLightColor,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  items: gender
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: kGreyColor,
                                fontFamily: "Poppins",
                                fontSize: 16,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the branch.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectedGender = value.toString();
                  },
                  onSaved: (value) {
                    selectedGender = value.toString();
                  },
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              CustomizedTextFormField(
                controller: ageController,
                hintText: 'Age',
                obscureText: false,
                readOnly: false,
              ),
              const SizedBox(
                height: 27,
              ),
              CustomizedTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },                controller: phoneNoController,
                hintText: 'Phone Number',
                obscureText: false,
                readOnly: false,
              ),
              const SizedBox(
                height: 27,
              ),
              CustomDateTimeField(
                timeRequired: true,
                dateController: dateController,
                dateFieldText: 'Date',
              ),
              const SizedBox(
                height: 27,
              ),
              CustomizedTextFormField(
                controller: weightController,
                hintText: 'Weight',
                obscureText: false,
                readOnly: false,
              ),
              const SizedBox(
                height: 27,
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              ReceptionistEnteredPatientDetailsScreen(
                                name: nameController.text,
                                gender: selectedGender,
                                age: ageController.text,
                                phoneNo: phoneNoController.text,
                                date: dateController.text,
                                weight: weightController.text,
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
  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(email);
  }
}
