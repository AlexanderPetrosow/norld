import 'package:flutter/material.dart';
import 'package:norld/main.dart';

String email = '';
String token = tokenBox?.read('token') ?? '';

String code = '';

// bool groundBuy = tokenBox?.read('groundBuy') ?? false;
bool groundBuy = false;
int gameStatus = 0;

DateTime gather = DateTime(2024);

ValueNotifier<bool> isUsd = ValueNotifier<bool>(true);
ValueNotifier<bool> isTokencoin = ValueNotifier<bool>(false);
ValueNotifier<bool> isBuy = ValueNotifier<bool>(false);
