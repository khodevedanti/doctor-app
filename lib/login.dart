import 'package:f2/constants.dart';
import 'package:f2/enter patient details.dart';
import 'package:f2/signup.dart';
import 'package:f2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class loginOne extends StatefulWidget {
  const loginOne({super.key});

  @override
  State<loginOne> createState() => _loginOneState();
}

class _loginOneState extends State<loginOne> {
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
              Row(
                children: [
                  Image(
                    height: 70,
                    width: 90,
                    image: AssetImage('images/ayush.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Login here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1F41BB),
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const CustomizedTextFormField(
                hintText: 'Email',
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height: 15,
              ),
              const CustomizedTextFormField(
                  hintText: 'Password', obscureText: false, readOnly: false),
              SizedBox(
                height: 20,
              ),
              Text('Forgot password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1F41BB),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  )),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  // Adjust the padding values as needed
                  child: SizedBox(
                    width: 288,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1F41BB), // Set the background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the border radius as needed
                        ),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 20, // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => FirstPage()),
               ),

                    child:Text('Create new account',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              Text('Or continue with',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1F41BB),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  )),
              Image(
                image: AssetImage('images/google.png'),
                height: (45),
                width: (30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
