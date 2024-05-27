import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/userInfo.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/bottomMenu.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool loading = false;
  UserInfo? userInfo;
  int typeStatus = 0;

  List types = [
    {'type': 0, 'name': 'Все', 'status': true},
    {'type': 1, 'name': 'Промоакции', 'status': false},
    {'type': 2, 'name': 'Ресурсы', 'status': false},
    {'type': 3, 'name': 'Активность', 'status': false},
  ];
  List notifications = [
    {
      'type': 2,
      'icon': 'wallet_icon',
      'title': 'Куплена земля',
      'desc': '1.000 единиц готовы у сбору',
      'date': '21:12',
      'button': Container()
    },
    {
      'type': 2,
      'icon': 'shovel_icon',
      'title': 'Время собирать ресурсы',
      'desc': '1.000 единиц готовы у сбору',
      'date': '10:02',
      'button': Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Bounce(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('Собрать')),
              )
            ],
          ))
    },
    {
      'type': 3,
      'icon': 'sign_icon',
      'title': 'Вход в аккаунт',
      'desc':
          'В ваш аккаунт выполнен вход через устройство IPhone, Россия, Москва',
      'date': '17:33',
      'button': Container()
    },
    {
      'type': 1,
      'icon': 'fav_icon',
      'title': 'Акция на земли -20%',
      'desc':
          'Земли на территории Северной Америке со скидкой -20% до 22.04.24',
      'date': '09:48',
      'button': Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Bounce(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primary,
                        border: Border.all(color: primary),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('Купить')),
              ),
              Bounce(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: bg2,
                        border: Border.all(color: border2),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('Подробнее')),
              )
            ],
          ))
    },
    {
      'type': 3,
      'icon': 'sign_icon',
      'title': 'Вход в аккаунт',
      'desc':
          'В ваш аккаунт выполнен вход через устройство IPhone, Россия, Москва',
      'date': '17:33',
      'button': Container()
    },
    {
      'type': 2,
      'icon': 'wallet_icon',
      'title': 'Куплена земля',
      'desc': '1.000 единиц готовы у сбору',
      'date': '21:12',
      'button': Container()
    },
    {
      'type': 2,
      'icon': 'shovel_icon',
      'title': 'Время собирать ресурсы',
      'desc': '1.000 единиц готовы у сбору',
      'date': '10:02',
      'button': Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Bounce(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('Собрать')),
              )
            ],
          ))
    },
    {
      'type': 3,
      'icon': 'sign_icon',
      'title': 'Вход в аккаунт',
      'desc':
          'В ваш аккаунт выполнен вход через устройство IPhone, Россия, Москва',
      'date': '17:33',
      'button': Container()
    },
    {
      'type': 1,
      'icon': 'fav_icon',
      'title': 'Акция на земли -20%',
      'desc':
          'Земли на территории Северной Америке со скидкой -20% до 22.04.24',
      'date': '09:48',
      'button': Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Bounce(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primary,
                        border: Border.all(color: primary),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('Купить')),
              ),
              Bounce(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        color: bg2,
                        border: Border.all(color: border2),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('Подробнее')),
              )
            ],
          ))
    },
  ];

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
      body: Column(
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
                      'Уведомления',
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
              Column(
                children: [
                  Container(
                    width: w,
                    height: h * 0.08,
                    color: mainColor1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                            types.length,
                            (i) => Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.015,
                                      right: w * 0.015,
                                      bottom: h * 0.02),
                                  child: Bounce(
                                    onTap: () {
                                      for (var t in types) {
                                        t['status'] = false;
                                      }
                                      types[i]['status'] = true;
                                      typeStatus = types[i]['type'];
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: bg2,
                                            border: Border.all(
                                                color: types[i]['status']
                                                    ? border2
                                                    : transparent),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Text(types[i]['name'])),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: h * 0.78,
                    child: ListView(
                      padding: EdgeInsets.only(top: 0, bottom: h * 0.12),
                      children: [
                        ...List.generate(notifications.length, ((index) {
                          if (typeStatus != 0) {
                            if (notifications[index]['type'] == typeStatus) {
                              return NotificationBox(
                                  w: w,
                                  index: index,
                                  notifications: notifications);
                            }
                            return Container();
                          } else {
                            return NotificationBox(
                                w: w,
                                index: index,
                                notifications: notifications);
                          }
                        }))
                      ],
                    ),
                  ),
                ],
              ),
              const BottomMenu(
                menuId: 2,
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key,
    required this.w,
    required this.index,
    required this.notifications,
  });

  final double w;
  final int index;
  final List notifications;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: index % 2 == 0 ? mainColor1 : Colors.black.withOpacity(0.15),
      leading: Container(
          width: w * 0.1,
          padding: EdgeInsets.all(w * 0.025),
          decoration: BoxDecoration(color: bg5, shape: BoxShape.circle),
          child: SvgPicture.asset(
            'assets/images/${notifications[index]['icon']}.svg',
            width: w * 0.05,
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
          )),
      trailing: Text(
        notifications[index]['date'],
        style: TextStyle(color: grey),
      ),
      title: Text(
        notifications[index]['title'],
        style: TextStyle(color: white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notifications[index]['desc'],
            style: TextStyle(color: grey),
          ),
          notifications[index]['button']
        ],
      ),
    );
  }
}
