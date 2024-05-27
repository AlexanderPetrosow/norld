import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/screens/home.dart';
import 'package:norld/screens/myGround.dart';
import 'package:norld/screens/profile.dart';
import 'package:norld/screens/splash.dart';
import 'package:get/get.dart';
import 'package:norld/screens/store.dart';
import 'package:norld/screens/wallet.dart';

GetStorage? tokenBox;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tokenBox = GetStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        colorScheme: ColorScheme.fromSeed(
            background: bg,
            primary: primary,
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/myGround', page: () => const MyGroundPage()),
        GetPage(name: '/store', page: () => const StorePage()),
        GetPage(name: '/wallet', page: () => const WalletPage()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
      ],
      // home: const SplashScreen(),
      home: const HomePage(),
    );
  }
}
