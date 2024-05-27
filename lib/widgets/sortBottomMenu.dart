import 'package:flutter/material.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/radiobtn.dart';

class SortMenu extends StatefulWidget {
  const SortMenu({super.key});

  @override
  State<SortMenu> createState() => _SortMenuState();
}

class _SortMenuState extends State<SortMenu> {
  int selectedValue = 1;

  void _handleRadioValueChange(int? value) {
    setState(() {
      selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: w,
          // height: h * 0.43,
          padding: EdgeInsets.only(
              top: h * 0.044,
              left: w * 0.05,
              right: w * 0.05,
              bottom: h * 0.037),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.029),
                child: Text(
                  'Сортировать',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              Radiobtn(
                selectedValue: selectedValue,
                value: 1,
                label: 'От дорогих к дешевым',
                onChanged: _handleRadioValueChange,
              ),
              Radiobtn(
                selectedValue: selectedValue,
                value: 2,
                label: 'От дешевых к дорогим',
                onChanged: _handleRadioValueChange,
              ),
              Radiobtn(
                selectedValue: selectedValue,
                value: 3,
                label: 'Новые земли',
                onChanged: _handleRadioValueChange,
              ),
              Radiobtn(
                selectedValue: selectedValue,
                value: 4,
                label: 'Уровень разведки (возрастание)',
                onChanged: _handleRadioValueChange,
              ),
              Radiobtn(
                selectedValue: selectedValue,
                value: 5,
                label: 'Уровень разведки (убывание)',
                onChanged: _handleRadioValueChange,
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.029),
                child: MainBtn(
                  sw: 1,
                  sh: 0.07,
                  fontsize: 15,
                  callback: () {},
                  text: 'Отправить',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
