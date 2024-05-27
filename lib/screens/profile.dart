import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bounce/bounce.dart';
import 'package:get/get.dart';
import 'package:norld/class/statusCheck.dart';
import 'package:norld/class/userInfo.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/main.dart';
import 'package:norld/request/getData.dart';
import 'package:norld/screens/firstScreen.dart';
import 'package:norld/widgets/mainBtn.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loading = false;
  UserInfo? userInfo;

  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    userInfo = await getUser();
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed('/home');
        return true;
      },
      child: Scaffold(
        backgroundColor: mainColor1,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  height: h * 0.1,
                  decoration: BoxDecoration(
                      color: mainColor1,
                      border: Border(bottom: BorderSide(color: border))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Bounce(
                          onTap: () => Get.toNamed('/home'),
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
              ),
              loading
                  ? SizedBox(width: w, child: const LinearProgressIndicator())
                  : Container(),
              SizedBox(
                  height: h * 0.85,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'ID',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle:
                            Text(userInfo != null ? userInfo!.body.id : ''),
                      ),
                      ListTile(
                        title: const Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle:
                            Text(userInfo != null ? userInfo!.body.email : ''),
                      ),
                      ListTile(
                        title: const Text(
                          'Ранг',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle:
                            Text(userInfo != null ? userInfo!.body.rank : ''),
                      ),
                      ListTile(
                        title: const Text(
                          'Баланс',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(userInfo != null
                            ? userInfo!.body.balance.toString()
                            : ''),
                      ),
                      ListTile(
                        title: const Text(
                          'Дата создания',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(userInfo != null
                            ? userInfo!.body.createdAt.toString()
                            : ''),
                      ),
                      ListTile(
                        title: const Text(
                          'Купить землю',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Switch(
                            value: groundBuy,
                            onChanged: (value) {
                              groundBuy = value;
                              // tokenBox?.write('groundBuy', groundBuy);
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.05),
                        child: MainBtn(
                          block: loading,
                          text: 'Выйти из аккаунта',
                          callback: (() async {
                            if (loading == false) {
                              if (mounted) {
                                setState(() {
                                  loading = true;
                                });
                              }
                              try {
                                StatusCheck res = await getLogout(token);
                                if (res.status) {
                                  tokenBox?.remove('token');
                                  Get.offAll(() => const FirstPage());
                                }
                              } catch (e) {
                                if (mounted) {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            }
                          }),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
