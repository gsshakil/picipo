import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TokenDropDownModel extends Equatable {
  final String? imagePath;
  final String? name;

  const TokenDropDownModel({required this.imagePath, required this.name});

  @override
  List<Object?> get props => [imagePath, name];
}

class DropdownList extends StatefulWidget {
  const DropdownList({Key? key}) : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  TokenDropDownModel? selectedValue = const TokenDropDownModel(
      imagePath: 'assets/ufarm-fav.png', name: 'UFARM');
  List<TokenDropDownModel> items = [
    const TokenDropDownModel(imagePath: 'assets/ufarm-fav.png', name: 'UFARM'),
    const TokenDropDownModel(imagePath: 'assets/ufarm-fav.png', name: 'PICIPO'),
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: items
            .map((item) => DropdownMenuItem<TokenDropDownModel>(
                  value: item,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ufarm-fav.png',
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.name.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as TokenDropDownModel;
          });
        },
        icon: const Icon(
          Icons.arrow_downward_sharp,
        ),
        iconSize: 14,
        buttonHeight: 50,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black12,
          ),
          color: Colors.white,
        ),
        buttonElevation: 1,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
