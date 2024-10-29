import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f2/constants.dart';
import 'package:f2/enter patient details.dart';
import 'package:f2/login.dart';
import 'package:f2/search%20bar.dart';
import 'package:f2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<String> list = [
    'Doctor',
    'Receptionist',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text('AYUSH Hospital'),
        // ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image(
                    height: 90,
                    width: 100,
                    image: AssetImage('images/ayush.png'),
                  ),
                ],
              ),
              Text('Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1F41BB),
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),), // Scaffold
              SizedBox(
                height: 30,
              ),
              const CustomizedTextFormField(
                hintText: 'Email',
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height:10,
              ),
              const CustomizedTextFormField(
                  hintText: 'Password', obscureText: false, readOnly: false),
              SizedBox(
                height:10,
              ),
              const CustomizedTextFormField(
                  hintText: 'Confirm Password', obscureText: false, readOnly: false),
              SizedBox(
                height:10,
              ),
              const CustomizedTextFormField(
                  hintText: 'Name', obscureText: false, readOnly: false),
              SizedBox(
                height:10,
              ),
              const CustomizedTextFormField(
                  hintText: 'DOB', obscureText: false, readOnly: false),
              SizedBox(
                height:10,
              ),
              const CustomizedTextFormField(
                  hintText: 'Phone no.', obscureText: false, readOnly: false),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height:50,
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kGreyColor,
                    isDense: false,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 2,
                        color: kPrimaryColor,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(width: 2, color: kPrimaryColor)),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'I am',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: Color(0xFF555555)),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: kPrimaryColor,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  selectedItemHighlightColor: kPrimaryColor,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  items: list
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Color(0xFF555555),
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
                    // gender = value.toString();
                  },
                  onSaved: (value) {
                    // gender = value.toString();
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  // Adjust the padding values as needed
                  child: SizedBox(
                    width: 240,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => searchBar()),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1F41BB), // Set the background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the border radius as needed
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
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
            ],
          ),
        ),
      ),
    );
  }
}
