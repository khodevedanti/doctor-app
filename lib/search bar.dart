import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f2/constants.dart';
import 'package:f2/login.dart';
import 'package:f2/search%20bar.dart';
import 'package:f2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class searchBar extends StatefulWidget {
  //const searchBar({super.key});
  var checkBoxStatus = false;
  var isCheckBoxSelected = false;

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final List<String> search = [
    'Lohasava',
    'Arka Pudina',
    'Lakshadi Guggulu',
    'Ashvagandharishta',
  ];

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('AYUSH HOSPITAL',
                style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFF1F41BB),
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              child: Column(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        isDense: false,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(width: 2, color: kPrimaryColor)),
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(width: 2, color: kPrimaryColor)),
                      ),
                      isExpanded: true,
                      hint: Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            color: Color(0xFF555555)),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: kPrimaryColor,
                      ),
                      iconSize: 30,
                      buttonHeight: 60,
                      selectedItemHighlightColor: kPrimaryLightColor,
                      buttonPadding: EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      items: search
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
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
                  CheckboxListTile(
                    value: checkboxValue1,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValue1 = value!;
                      });
                    },
                    title: const Text('guggulu'),
                    subtitle: const Text('abra ka dabra'),
                  ),
                  const Divider(height: 0),
                  CheckboxListTile(
                    value: checkboxValue2,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValue2 = value!;
                      });
                    },
                    title: const Text('Churna'),
                    subtitle: const Text(
                        'pet safa to, har rog dafa'),
                  ),
                  const Divider(height: 0),
                ],
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
                  onPressed: () =>
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => searchBar()),
                      ),
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
    );
  }
}
