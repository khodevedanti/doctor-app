import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:f2/constants.dart';
import 'package:f2/screens/doctor_screens/medicine_quantity_screen.dart';
import 'package:f2/widgets/custom_drop_down_search.dart';
import 'package:f2/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MedicineSearchScreen extends StatefulWidget {
  const MedicineSearchScreen({super.key});

  @override
  State<MedicineSearchScreen> createState() => _MedicineSearchScreenState();
}

final _medicineSearchPopupBuilderKey = GlobalKey<DropdownSearchState<String>>();

final _medicineSearchMultiKey = GlobalKey<DropdownSearchState<String>>();

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  int indexOfMedicineList = 0;
  final List<String> domain = [
    'Ayurvedic',
    'Unani',
    'Siddha',
    'Homeopathy',
  ];
  final List<List<String>> medicinesList = [
    ["a1", "a2", "a3", "a4"],
    ["u1", "u2", "u3", "u4"],
    ["s1", "s2", "s3", "s4"],
    ["h1", "h2", "h3", "h4"],
  ];
  String selectedDomain = "";
  final TextEditingController searchMedicineController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Screen Rebuilt");
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
              const Row(
                children: [
                  CustomRichText(
                    textName: 'Name',
                    textResponse: 'Suyash Dahake',
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  CustomRichText(
                    textName: 'Date',
                    textResponse: 'Suyash Dahake',
                  ),
                ],
              ),
              const CustomRichText(
                textName: 'Age',
                textResponse: 'Suyash Dahake',
              ),
              const CustomRichText(
                textName: 'Gender',
                textResponse: 'Suyash Dahake',
              ),
              const CustomRichText(
                textName: 'Weight',
                textResponse: 'Suyash Dahake',
              ),
              const CustomRichText(
                textName: 'Phone No. ',
                textResponse: 'Suyash Dahake',
              ),
              const SizedBox(
                height: 18,
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
                    'Domain',
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Poppins", color: kGreyColor),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  selectedItemHighlightColor: kPrimaryLightColor,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  items: domain
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
                      return 'Please select the domain.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      indexOfMedicineList = domain.indexOf(value!);
                    });
                    selectedDomain = value.toString();
                  },
                  onSaved: (value) {
                    selectedDomain = value.toString();
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomDropDownSearch(
                itemList: medicinesList[indexOfMedicineList],
                multiKey: _medicineSearchMultiKey,
                popupBuilderKey: _medicineSearchPopupBuilderKey,
                labelText: 'Search',
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
                    onPressed: () {
                      print(searchMedicineController.text);
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           const MedicineQuantityScreen()),
                      // );
                    },
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
