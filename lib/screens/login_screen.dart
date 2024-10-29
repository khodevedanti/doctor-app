import 'package:f2/constants.dart';
import 'package:f2/screens/create_account_screen.dart';
import 'package:f2/screens/doctor_screens/doctor_home_screen.dart';
import 'package:f2/screens/receptionist_screens/enter_patient_details_screen.dart';
import 'package:f2/screens/receptionist_screens/receptionist_home_screen.dart';
import 'package:f2/utils/validators.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    height: 18,
                  ),
                  const Text(
                    'Login here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 104,
                  ),
                  CustomizedTextFormField(
                    validator: validateEmail,
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    readOnly: false,
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  CustomizedTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: false,
                    readOnly: false,
                    validator: validatePassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (emailController.text ==
                                "khodevedanti13@gmail.com") {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DoctorHomeScreen()),
                              );
                            } else if (emailController.text == "om@gmail.com") {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReceptionistHomeScreen()),
                              );
                            } else {
                              showUserNotExistDialog(context);
                            }
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
                          'Sign in',
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
                    height: 47,
                  ),
                  const SizedBox(
                    width: 288,
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()),
                      );
                    },
                    child: const Text(
                      'Create new account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 122,
                  ),
                  const Text(
                    'Or continue with',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showUserNotExistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('User Not Exist'),
          content: const Text('The user you are looking for does not exist.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
