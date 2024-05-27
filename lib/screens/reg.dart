import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/signIn.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/request/getData.dart';
import 'package:norld/screens/emailCode.dart';
import 'package:norld/widgets/customField.dart';
import 'package:norld/widgets/mainBtn.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final controller = TextEditingController();
  bool loading = false;
  String? errText;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: transparent,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            decoration: BoxDecoration(gradient: bgGradient),
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.1,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: transparent))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Bounce(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.all(w * 0.025),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: bg4),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: w * 0.035,
                              color: white,
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'logo',
                          child: SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: w * 0.3,
                            alignment: Alignment.center,
                          ),
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
                loading
                    ? SizedBox(width: w, child: const LinearProgressIndicator())
                    : Container(),
                SizedBox(
                  height: h * 0.68,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Для регистрации\nукажите почту',
                        style: TextStyle(
                            color: white,
                            fontSize: w * 0.07,
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: Text(
                          'на нее будет отправлен код для\nпотверждения входа.',
                          style: TextStyle(
                            color: grey,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ),
                      CustomField(
                        controller: controller,
                        errText: errText,
                        label: 'E-mail',
                        inputType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: MainBtn(
                            block: loading,
                            // callback: () => Get.to(() => const EmailCodePage()),
                            callback: (() async {
                              if (controller.text.isNotEmpty) {
                                if (loading == false) {
                                  if (mounted) {
                                    setState(() {
                                      loading = true;
                                    });
                                  }
                                  try {
                                    SignIn res =
                                        await getSignIn(controller.text);
                                    if (res.status) {
                                      email = controller.text;
                                      code = res.body.code;
                                      if (mounted) {
                                        setState(() {
                                          errText = null;
                                          loading = false;
                                        });
                                      }
                                      Get.to(() => const EmailCodePage());
                                    } else {
                                      if (mounted) {
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    }
                                    print('Code: ${res.body.code}');
                                  } catch (e) {
                                    print(e);
                                    if (mounted) {
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  }
                                }
                              } else {
                                if (mounted) {
                                  setState(() {
                                    errText = 'Заполните поля';
                                  });
                                }
                              }
                            }),
                            text: 'Продолжить'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
