import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f2/constants.dart';
import 'package:f2/screens/login_screen.dart';
import 'package:f2/screens/receptionist_screens/enter_patient_details_screen.dart';
import 'package:f2/utils/validators.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_date_time_field.dart';
import '../widgets/custom_text_form_field.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> profession = [
    'Doctor',
    'Receptionist',
  ];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  String professionSelected = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        height: 64,
                        width: 80,
                        image:
                            AssetImage('assets/images/ministry-of-ayush.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomizedTextFormField(
                    validator: validateEmail,
                    hintText: 'Email',
                    obscureText: false,
                    readOnly: false,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomizedTextFormField(
                    validator: validatePassword,
                    hintText: 'Password',
                    obscureText: false,
                    readOnly: false,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomizedTextFormField(
                    hintText: ' Confirm Password',
                    obscureText: false,
                    readOnly: false,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm password is required';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomizedTextFormField(
                    hintText: 'Name',
                    obscureText: false,
                    readOnly: false,
                    controller: nameController,
                    validator: validateName,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomizedTextFormField(
                    hintText: 'Phone No.',
                    obscureText: false,
                    readOnly: false,
                    controller: phoneNoController,
                    validator: validatePhoneNo,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomDateTimeField(
                    timeRequired: false,
                    dateFieldText: 'DOB',
                    dateController: dobController,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  DropdownButtonFormField2(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: kBgColor,
                      isDense: false,
                      contentPadding: EdgeInsets.zero,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 3,
                          color: kRedColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 3,
                          color: kPrimaryColor,
                        ),
                      ),
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
                      errorStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'I am a',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          color: kGreyColor),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: kPrimaryColor,
                    ),
                    iconSize: 30,
                    buttonHeight: 50,
                    selectedItemHighlightColor: kPrimaryLightColor,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    items: profession
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
                        return 'Please select your role.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      professionSelected = value.toString();
                    },
                    onSaved: (value) {
                      professionSelected = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EnterPatientDetails()),
                            );
                          }
                        },
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
                          'Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 20 // Text color
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                    child: const Text(
                      'Already have an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF494949),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    'Or continue with',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: ShapeDecoration(
                      color: kLightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Image.asset("assets/icons/google_icon.png")),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
