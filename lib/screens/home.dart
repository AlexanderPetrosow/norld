import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/mapPolygon.dart';
import 'package:norld/class/mapPolygons.dart';
import 'package:norld/class/userInfo.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/global/tile_providers.dart';
import 'package:latlong2/latlong.dart';
import 'package:norld/request/getData.dart';
import 'package:norld/screens/notification.dart';
import 'package:norld/widgets/bottomMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  UserInfo? userInfo;

  @override
  void initState() {
    // load();
    // loadMap();
    loadJsonMap();
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

  final mapControl = MapController();

  MapPolygon maps = MapPolygon();
  Map jsons = {};
  List<MapPolygons> mapsJson = [];

  loadMap() async {
    maps = await getMap();
    print(maps.body?.length);
    if (mounted) {
      setState(() {});
    }
  }

  loadJsonMap() async {
    String response = '';
    for (var i = 0; i < loads.length; i++) {
      response = await rootBundle.loadString('assets/json/$i.json');
      jsons['json$i'] = response;
      print('Load: $i.json');
    }
    mapsJson = mapPolygonsFromJson(jsons['json0']);
    loads[0] = true;
    if (mounted) {
      setState(() {});
    }
  }

  List loads = [false, false, false, false];

  double ltt = 47.41322;
  double lgt = -1.219482;

  double mapZoom = 4;

  change() async* {}

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    // tokenBox?.write('token', 'E21KQubqkdTa4FGNmRewVzrgWAnMlfYL0yZB');
    print(token);
    print(groundBuy);
    print(loads);

    return WillPopScope(
      onWillPop: (() => exit(0)),
      child: Scaffold(
        backgroundColor: mainColor1,
        body: Column(
          children: [
            SafeArea(
              child: Container(
                height: h * 0.1,
                decoration: BoxDecoration(
                    color: mainColor1,
                    border: Border(bottom: BorderSide(color: border))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Get.toNamed('profile');
                            },
                            child: SvgPicture.asset(
                              'assets/images/rank1.svg',
                              height: h * 0.075,
                              width: w * 0.1,
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: w * 0.55,
                                  child: Text(
                                    userInfo != null
                                        ? userInfo!.body.email
                                        : '',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: white, fontSize: w * 0.04),
                                  ),
                                ),
                                Text(
                                  userInfo != null
                                      ? '${userInfo!.body.rank} ранг'
                                      : '',
                                  style: TextStyle(
                                      color: white, fontSize: w * 0.04),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: (() => Get.to(() => const NotificationPage())),
                        child: Container(
                          padding: EdgeInsets.all(w * 0.025),
                          decoration: BoxDecoration(
                              color: bg5,
                              borderRadius: BorderRadius.circular(w * 0.015)),
                          child: SvgPicture.asset(
                            'assets/images/notif_deac.svg',
                            height: h * 0.025,
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.center,
                          ),
                        ),
                      )
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
              child: Stack(alignment: Alignment.topCenter, children: [
                FlutterMap(
                  mapController: mapControl,
                  options: MapOptions(
                      backgroundColor: mainColor1,
                      initialCenter: LatLng(lgt, ltt),
                      interactionOptions: const InteractionOptions(
                          pinchMoveThreshold: 25,
                          flags:
                              InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                          enableScrollWheel: true,
                          scrollWheelVelocity: 1),
                      initialZoom: mapZoom,
                      minZoom: 4,
                      maxZoom: 8,
                      cameraConstraint: CameraConstraint.contain(
                        bounds: LatLngBounds(
                          const LatLng(-double.infinity, -180),
                          const LatLng(double.infinity, 180),
                        ),
                      ),
                      onMapEvent: (position) {
                        if (position.source == MapEventSource.dragEnd) {
                          ltt = position.camera.center.latitude;
                          lgt = position.camera.center.longitude;
                          print('Start: ${position.camera.zoom}, My $mapZoom');
                          mapZoom = double.parse(
                              position.camera.zoom.round().toString());
                          mapControl.move(
                              LatLng(position.camera.center.latitude,
                                  position.camera.center.longitude),
                              mapZoom);
                          switch (mapZoom) {
                            case 4:
                              if (loads[0] == false) {
                                print('!!!! ------444444');
                                for (var i = 0; i < loads.length; i++) {
                                  loads[i] = false;
                                }
                                loads[0] = true;
                                mapsJson = mapPolygonsFromJson(jsons['json0']);
                                setState(() {});
                              }
                              break;
                            case 5:
                              if (loads[1] == false) {
                                print('!!!! ------555555');
                                for (var i = 0; i < loads.length; i++) {
                                  loads[i] = false;
                                }
                                loads[1] = true;
                                mapsJson = mapPolygonsFromJson(jsons['json1']);
                                setState(() {});
                              }
                              break;
                            case 6:
                              if (loads[2] == false) {
                                print('!!!! ------6666666');
                                for (var i = 0; i < loads.length; i++) {
                                  loads[i] = false;
                                }
                                loads[2] = true;
                                mapsJson = mapPolygonsFromJson(jsons['json2']);
                                setState(() {});
                              }
                              break;
                            case 7:
                              if (loads[3] == false) {
                                print('!!!! ------77777777');
                                for (var i = 0; i < loads.length; i++) {
                                  loads[i] = false;
                                }
                                loads[3] = true;
                                mapsJson = mapPolygonsFromJson(jsons['json3']);
                                setState(() {});
                              }
                              break;
                            default:
                          }

                          print('End: ${position.camera.zoom}, My $mapZoom');
                        }
                      }
                      // onPositionChanged: (position, hasGesture) {
                      // ltt = position.center!.latitude;
                      // lgt = position.center!.longitude;

                      // if (hasGesture) {
                      //   print('Start: ${position.zoom}, My $mapZoom');
                      //   mapZoom =
                      //       double.parse(position.zoom!.round().toString());

                      //   switch (mapZoom) {
                      //     case 4:
                      //       if (loads[0] == false) {
                      //         print('!!!! ------444444');
                      //         for (var i = 0; i < loads.length; i++) {
                      //           loads[i] = false;
                      //         }
                      //         loads[0] = true;
                      //         mapsJson = mapPolygonsFromJson(jsons['json0']);
                      //         mapControl.move(
                      //             LatLng(position.center!.latitude,
                      //                 position.center!.longitude),
                      //             mapZoom);
                      //         setState(() {});
                      //       }
                      //       break;
                      //     case 5:
                      //       if (loads[1] == false) {
                      //         print('!!!! ------555555');
                      //         for (var i = 0; i < loads.length; i++) {
                      //           loads[i] = false;
                      //         }
                      //         loads[1] = true;
                      //         mapsJson = mapPolygonsFromJson(jsons['json1']);
                      //         mapControl.move(
                      //             LatLng(position.center!.latitude,
                      //                 position.center!.longitude),
                      //             mapZoom);
                      //         setState(() {});
                      //       }
                      //       break;
                      //     case 6:
                      //       if (loads[2] == false) {
                      //         print('!!!! ------6666666');
                      //         for (var i = 0; i < loads.length; i++) {
                      //           loads[i] = false;
                      //         }
                      //         loads[2] = true;
                      //         mapsJson = mapPolygonsFromJson(jsons['json2']);
                      //         mapControl.move(
                      //             LatLng(position.center!.latitude,
                      //                 position.center!.longitude),
                      //             mapZoom);
                      //         setState(() {});
                      //       }
                      //       break;
                      //     case 7:
                      //       if (loads[3] == false) {
                      //         print('!!!! ------77777777');
                      //         for (var i = 0; i < loads.length; i++) {
                      //           loads[i] = false;
                      //         }
                      //         loads[3] = true;
                      //         mapsJson = mapPolygonsFromJson(jsons['json3']);
                      //         mapControl.move(
                      //             LatLng(position.center!.latitude,
                      //                 position.center!.longitude),
                      //             mapZoom);
                      //         setState(() {});
                      //       }
                      //       break;
                      //     default:
                      //   }

                      //   print('End: ${position.zoom}, My $mapZoom');
                      // }

                      // print("Z: ${position.zoom}");
                      // switch (position.zoom?.floor()) {
                      //   case 4:
                      //     if (loads[0] == false) {
                      //       print('!!!! ------444444');
                      //       loads[1] = false;
                      //       loads[0] = true;
                      //       mapsJson = mapPolygonsFromJson(jsons['json0']);
                      //       setState(() {});
                      //     }
                      //     break;
                      //   case 5:
                      //     if (loads[1] == false) {
                      //       print('!!!! ------555555');
                      //       loads[0] = false;
                      //       loads[1] = true;
                      //       mapsJson = mapPolygonsFromJson(jsons['json1']);
                      //       setState(() {});
                      //     }
                      //     break;
                      //   default:
                      // }
                      // },
                      ),
                  children: [
                    openStreetMapTileLayer,
                    PolygonLayer(
                      polygons: [
                        ...List.generate(
                            mapsJson.length,
                            (i) => Polygon(
                                  points: [
                                    ...List.generate(
                                        mapsJson[i].coordinates?.length ?? 0,
                                        (m) => LatLng(
                                            mapsJson[i].coordinates?[m].last ??
                                                0,
                                            mapsJson[i].coordinates?[m].first ??
                                                0)),
                                  ],
                                  borderStrokeWidth: 1,
                                  borderColor: white,
                                )),
                      ],
                    )
                  ],
                ),
                const BottomMenu(
                  menuId: 0,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

                          // ...List.generate(
                          //     maps.body?.length ?? 0,
                          //     (i) => Polygon(
                          //           points: [
                          //             ...List.generate(
                          //                 maps.body?[i].coordinates?.length ?? 0,
                          //                 (m) => LatLng(
                          //                     maps.body?[i].coordinates?[m]
                          //                             .first ??
                          //                         0,
                          //                     maps.body?[i].coordinates?[m]
                          //                             .last ??
                          //                         0)),
                          //           ],
                          //           borderStrokeWidth: 4,
                          //           borderColor: white,
                          //         )),