import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:norld/class/mapPolygon.dart';
import 'package:norld/class/statusCheck.dart';
import 'package:norld/class/emailConfirm.dart';
import 'package:norld/class/signIn.dart';
import 'package:norld/class/userInfo.dart';
import 'package:norld/global/variable.dart';

String baseUrl = 'http://api.bsod.fans:44219';

// - - - - - - - -
// - - Sign In - -
// - - - - - - - -
signInRequest(String email) async {
  String result = '';
  var headersList = {'Accept': '*/*'};
  var url = Uri.parse('$baseUrl/user/sign-in');

  var body = {'email': email};

  var req = http.MultipartRequest('POST', url);
  req.headers.addAll(headersList);
  req.fields.addAll(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    result = resBody;
  } else {
    print(res.reasonPhrase);
  }
  return result;
}

Future<SignIn> getSignIn(String email) async {
  String str = await signInRequest(email);
  SignIn res = signInFromJson(str);
  return res;
}

// - - - - - - - - - - -
// - - Email confirm - -
// - - - - - - - - - - -
emailConfirmRequest(String email, String code) async {
  String result = '';
  var headersList = {'Accept': '*/*'};
  var url = Uri.parse('$baseUrl/user/email-confirm');

  var body = {'email': email, 'code': code};

  var req = http.MultipartRequest('POST', url);
  req.headers.addAll(headersList);
  req.fields.addAll(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    result = resBody;
  } else {
    print(res.reasonPhrase);
  }
  return result;
}

Future<EmailConfirm> getEmailConfirm(String email, String code) async {
  String str = await emailConfirmRequest(email, code);
  EmailConfirm res = emailConfirmFromJson(str);
  return res;
}

// - - - - - - - - - - - - -
// - - Confirm invitation- -
// - - - - - - - - - - - - -
confirmInvitationRequest(String code) async {
  String result = '';
  var headersList = {'Accept': '*/*', 'Authorization': 'Bearer $token'};
  var url = Uri.parse('$baseUrl/user/confirm-invitation');

  var body = {'code': code};

  var req = http.MultipartRequest('POST', url);
  req.headers.addAll(headersList);
  req.fields.addAll(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    result = resBody;
  } else {
    print(res.reasonPhrase);
  }
  return result;
}

Future<StatusCheck> getConfirmInvitation(String code) async {
  String str = await confirmInvitationRequest(code);
  StatusCheck res = statusCheckFromJson(str);
  return res;
}

// - - - - - - -
// - - Logout- -
// - - - - - - -
logoutRequest() async {
  String result = '';
  var headersList = {'Accept': '*/*', 'Authorization': 'Bearer $token'};
  var url = Uri.parse('$baseUrl/user/logout');

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    result = resBody;
  } else {
    print(res.reasonPhrase);
  }
  return result;
}

Future<StatusCheck> getLogout(String token) async {
  String str = await logoutRequest();
  StatusCheck res = statusCheckFromJson(str);
  return res;
}

// - - - - - - -
// - - User- - -
// - - - - - - -
userRequest() async {
  String result = '';
  var headersList = {'Accept': '*/*', 'Authorization': 'Bearer $token'};
  var url = Uri.parse('$baseUrl/user/get');

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    result = resBody;
  } else {
    print(res.reasonPhrase);
  }
  return result;
}

Future<UserInfo> getUser() async {
  String str = await userRequest();
  UserInfo res = userInfoFromJson(str);
  return res;
}

// - - - - - - - - - -
// - - Map (GET) - - -
// - - - - - - - - - -
getMapRequest() async {
  String result = '';
  var headersList = {
    'Accept': '*/*',
    'Authorization': 'Bearer iZ41WUvEz6nlSJKL7fq5ctuye0RkMGxQCVXH',
    'Content-Type': 'application/json'
  };
  var url = Uri.parse('http://api.bsod.fans:44219/map/get');

  var body = {
    "level": 0,
    "coordinates": [
      [-100.37109375, 43.51668853502909],
      [135.87890625000003, 43.51668853502909],
      [135.87890625000003, -33.797408767572485],
      [-100.37109375, -33.797408767572485],
      [-100.37109375, 43.51668853502909]
    ]
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    result = resBody;
  } else {
    print(res.reasonPhrase);
  }
  return result;
}

Future<MapPolygon> getMap() async {
  String str = await getMapRequest();
  MapPolygon res = mapPolygonFromJson(str);
  return res;
}
