import 'package:flutter/material.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/checkbox.dart';
import 'package:norld/widgets/customDropdown.dart';
import 'package:norld/widgets/landswitcher.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  double lowerValue = 0;
  double upperValue = 0;
  String? selectedValue;
  final List<String> items = ['Континент', 'Континент 2', 'Континент 3', 'Континент 4'];
  bool rareLand = true;
  bool saleLand = true;
  bool myLand = true;
  bool buyPermanent = false;
  bool auction = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.785,
      padding: EdgeInsets.only(
          top: h * 0.044, left: w * 0.05, right: w * 0.05, bottom: h * 0.037),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.029),
            child: Text(
              'Фильтрация',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Уровень земли',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                '${upperValue.toInt()} LVL',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RangeSliderFlutter(
            values: [lowerValue, upperValue],
            rangeSlider: true,
            tooltip: RangeSliderFlutterTooltip(disabled: true),
            max: 100,
            handlerHeight: h * 0.034,
            trackBar: RangeSliderFlutterTrackBar(
              activeTrackBarHeight: 2,
              inactiveTrackBarHeight: 2,
              activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primary,
              ),
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: grey3,
              ),
            ),
            min: 0,
            rightHandler: RangeSliderFlutterHandler(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                ),
                width: 16,
                height: 16,
              ),
            ),
            handler: RangeSliderFlutterHandler(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                ),
                width: 16,
                height: 16,
              ),
            ),
            onDragging: (handlerIndex, lower, upper) {
              setState(() {
                lowerValue = lower;
                upperValue = upper;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.029),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '99+',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              SizedBox(
                height: h * 0.072,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 2,
                      height: 12,
                      color: white,
                    ),
                    Container(
                      width: 2,
                      height: 12,
                      color: white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.029),
                child: CustomDropdownButton2(
                  hint: items.first,
                  value: selectedValue,
                  dropdownItems: items,
                  dropdownWidth: w * 0.9,
                  buttonWidth: w,
                  buttonHeight: h * 0.072,
                  offset: Offset(0, -5),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonPadding:
                      EdgeInsets.only(left: w * 0.056, right: w * 0.058),
                  buttonDecoration: BoxDecoration(
                    color: white.withOpacity(0.04),
                    border: Border.all(width: 1, color: white.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  dropdownDecoration: BoxDecoration(
                    color: bg2,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: white.withOpacity(0.3)),
                  ),
                ),
              ),
            ],
          ),
          LandSwitcher(
              onChanged: (value) {
                setState(() {
                  rareLand = value;
                });
              },
              label: 'Только редкие земли',
              valueSw: rareLand),
          LandSwitcher(
              onChanged: (value) {
                setState(() {
                  saleLand = value;
                });
              },
              label: 'Только земли на продажу',
              valueSw: saleLand),
          LandSwitcher(
              onChanged: (value) {
                setState(() {
                  myLand = value;
                });
              },
              label: 'Только мои земли',
              valueSw: myLand),
          Padding(
             padding: EdgeInsets.only(bottom: h * 0.029),
            child: Text(
              'Способ покупки',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: w * 0.1),
                child: CustomCheckbox(
                  label: 'Купить сразу',
                  value: buyPermanent,
                  onChanged: (value) {
                    setState(() {
                      buyPermanent = value;
                    });
                  },
                  activeColor: primary, 
                  activeBorderColor: primary,
                ),
              ),
              CustomCheckbox(
                label: 'Аукцион',
                value: auction,
                onChanged: (value) {
                  setState(() {
                    auction = value;
                  });
                },
                activeColor: primary, 
                activeBorderColor: primary,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.039),
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
    );
  }
}
