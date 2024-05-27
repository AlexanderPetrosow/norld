import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/widgets/bottomMenu.dart';
import 'package:norld/widgets/customField.dart';
import 'package:norld/widgets/mainBtn.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  bool loading = false;

  final myWlt = TextEditingController();
  String? errTextMyWlt;
  final convertWlt = TextEditingController();
  String? errTextConvertWlt;

  List wallets = [
    {'value': 1, 'name': 'Etherium'},
    {'value': 2, 'name': 'Matic'},
    {'value': 3, 'name': 'Norld'},
    {'value': 4, 'name': 'Ресурсы'},
  ];
  int selectWal1 = 1;
  int selectWal2 = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: mainColor1,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: h * 0.1,
                decoration: BoxDecoration(
                  color: mainColor1,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bounce(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: EdgeInsets.all(w * 0.025),
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, color: bg4),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: w * 0.035,
                            color: white,
                          ),
                        ),
                      ),
                      Text(
                        'Обменять',
                        style: TextStyle(
                            color: white,
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.w800),
                      ),
                      Container(
                        padding: EdgeInsets.all(w * 0.02),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: transparent),
                        child: Icon(
                          Icons.near_me_rounded,
                          color: transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            loading
                ? SizedBox(width: w, child: const LinearProgressIndicator())
                : Container(),
            SizedBox(
              height: h * (loading ? 0.86 : 0.865),
              child: Stack(children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(w * 0.03),
                          decoration: BoxDecoration(
                              color: snackbar.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(w * 0.01)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: w * 0.4,
                                  child: Text(
                                    'Выберите токен для обмена',
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.04),
                                  )),
                              DropdownMenu(
                                  initialSelection: selectWal1,
                                  onSelected: (value) {
                                    selectWal1 = value;
                                    setState(() {});
                                  },
                                  trailingIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: white,
                                  ),
                                  selectedTrailingIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: white,
                                  ),
                                  textStyle: TextStyle(color: white),
                                  inputDecorationTheme: InputDecorationTheme(
                                    filled: true,
                                    fillColor: snackbar.withOpacity(0.1),
                                    contentPadding:
                                        EdgeInsets.only(left: w * 0.02),
                                    border: InputBorder.none,
                                  ),
                                  menuStyle: MenuStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(mainColor1),
                                  ),
                                  dropdownMenuEntries: [
                                    ...List.generate(
                                        wallets.length,
                                        ((i) => DropdownMenuEntry(
                                            value: wallets[i]['value'],
                                            label: wallets[i]['name'],
                                            enabled: wallets[i]['value'] !=
                                                    selectWal2
                                                ? true
                                                : false))),
                                  ])
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.02),
                          child: CustomField(
                              errText: errTextMyWlt,
                              controller: myWlt,
                              inputType: TextInputType.number,
                              label: 'Укажите сумму'),
                        ),
                        Container(
                          width: w,
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              text: 'Доступно для вывода ',
                              style: TextStyle(color: grey),
                              children: [
                                TextSpan(
                                    text: '24 ETH',
                                    style: TextStyle(color: white)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.03),
                          child: Container(
                            padding: EdgeInsets.all(w * 0.03),
                            decoration: BoxDecoration(
                                color: snackbar.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(w * 0.01)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: w * 0.4,
                                    child: Text(
                                      'На что хотите поменять?',
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.04),
                                    )),
                                DropdownMenu(
                                    initialSelection: selectWal2,
                                    onSelected: (value) {
                                      selectWal2 = value;
                                      setState(() {});
                                    },
                                    trailingIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: white,
                                    ),
                                    selectedTrailingIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: white,
                                    ),
                                    textStyle: TextStyle(color: white),
                                    inputDecorationTheme: InputDecorationTheme(
                                      filled: true,
                                      fillColor: snackbar.withOpacity(0.1),
                                      contentPadding:
                                          EdgeInsets.only(left: w * 0.02),
                                      border: InputBorder.none,
                                    ),
                                    menuStyle: MenuStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(mainColor1),
                                    ),
                                    dropdownMenuEntries: [
                                      ...List.generate(
                                        wallets.length,
                                        ((i) => DropdownMenuEntry(
                                            value: wallets[i]['value'],
                                            label: wallets[i]['name'],
                                            enabled: wallets[i]['value'] !=
                                                    selectWal1
                                                ? true
                                                : false)),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.02),
                          child: CustomField(
                              errText: errTextConvertWlt,
                              controller: convertWlt,
                              inputType: TextInputType.number,
                              label: 'Укажите сумму'),
                        ),
                        Container(
                          width: w,
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              text: 'Доступно для получения ',
                              style: TextStyle(color: grey),
                              children: [
                                TextSpan(
                                    text: '1000 ресурсов',
                                    style: TextStyle(color: white)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.05, bottom: h * 0.02),
                          child: Container(
                            padding: EdgeInsets.all(w * 0.03),
                            decoration: BoxDecoration(
                                color: white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(w * 0.02)),
                            child: Text(
                              'Ресурсы будут добавлены после одного подтверждения в блочейне.',
                              style:
                                  TextStyle(color: white, fontSize: w * 0.04),
                            ),
                          ),
                        ),
                        MainBtn(
                          text: 'Отправить',
                          callback: () {
                            errTextMyWlt =
                                myWlt.text.isNotEmpty ? null : 'Заполните поля';
                            errTextConvertWlt = convertWlt.text.isNotEmpty
                                ? null
                                : 'Заполните поля';
                            if (errTextMyWlt == null &&
                                errTextConvertWlt == null) {
                              Get.back(result: true);
                            } else {
                              if (mounted) {
                                setState(() {});
                              }
                            }
                          },
                        )
                      ],
                    )),
                BottomMenu(
                  menuId: groundBuy ? 4 : 2,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
