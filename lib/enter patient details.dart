import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f2/constants.dart';
import 'package:f2/login.dart';
import 'package:f2/search%20bar.dart';
import 'package:f2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<String> gender = [
    'Male',
    'Female',
    'Others',
  ];
  final List<String> domain = [
    'Ayurveda',
    'Unani',
    'Siddha',
    'Homeopathy',
  ];
  TextEditingController name = TextEditingController();

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
                    height: 90,
                    width: 100,
                    image: AssetImage('images/ayush.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter patient details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1F41BB),
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomizedTextFormField(
                hintText: 'Name',
                controller: name,
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
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
                    'Gender',
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
                  selectedItemHighlightColor: kPrimaryLightColor,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  items: gender
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
              SizedBox(
                height: 15,
              ),
              const CustomizedTextFormField(
                hintText: 'Age',
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height: 15,
              ),
              const CustomizedTextFormField(
                hintText: 'Phone Number',
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height: 15,
              ),
              const CustomizedTextFormField(
                hintText: 'Date',
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height: 15,
              ),
              const CustomizedTextFormField(
                hintText: 'Weight',
                obscureText: false,
                readOnly: false,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    isDense: false,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(width: 2, color: kPrimaryColor)),
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(width: 2, color: kPrimaryColor)),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Domain',
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
                  selectedItemHighlightColor: kPrimaryLightColor,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  items: domain
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
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => searchBar()),
                      // );
                    print(name.text);
                     },

                    // Button action goes here
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 20 // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
