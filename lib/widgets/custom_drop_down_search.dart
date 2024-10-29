import 'package:dropdown_search/dropdown_search.dart';
import 'package:f2/constants.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  const CustomDropDownSearch({
    super.key,
    required this.multiKey,
    required this.popupBuilderKey,
    required this.labelText,
    required this.itemList,
  });

  final String labelText;
  final popupBuilderKey;
  final multiKey;
  final List<String> itemList;

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

bool? _popupBuilderSelection = false;

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void _handleCheckBoxState({bool updateState = true}) {
    print(widget.popupBuilderKey.currentState);
    var selectedItem =
        widget.popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
    var isAllSelected =
        widget.popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
    _popupBuilderSelection =
        selectedItem.isEmpty ? false : (isAllSelected ? true : null);
    print(selectedItem);
    if (updateState) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
        suffixIconColor: kPrimaryColor,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        errorStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "Poppins",
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 3,
            color: kRedColor,
          ),
        ),
        fillColor: kBgColor,
        border: InputBorder.none,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xFF555555),
          fontFamily: "Poppins",
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
      )),
      key: widget.multiKey,
      items: widget.itemList,
      popupProps: PopupPropsMultiSelection.dialog(
        searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: "Poppins",
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 3,
              color: kRedColor,
            ),
          ),
          fillColor: kBgColor,
          border: InputBorder.none,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF555555),
            fontFamily: "Poppins",
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
        )),
        onItemAdded: (l, s) => _handleCheckBoxState(),
        onItemRemoved: (l, s) => _handleCheckBoxState(),
        showSearchBox: true,
        containerBuilder: (ctx, popupWidget) {
          return Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      // How should I unselect all items in the list?
                      widget.multiKey.currentState?.closeDropDownSearch();
                    },
                  ),
                ),
              ),
              Expanded(child: popupWidget),
            ],
          );
        },
      ),
    );
  }
}
