import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
/*
Future<void> WritrtUserData(userData) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', userData['token']);
  await prefs.setString('email', userData['data']['email']);
  await prefs.setString('firstName', userData['data']['firstName']);
  await prefs.setString('lastName', userData['data']['lastName']);
  await prefs.setString('mobile', userData['data']['mobile']);
  await prefs.setString('photo', userData['data']['photo']);
}
*/

Future<void> WriteUserData(UserData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['token']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('firstName', UserData['data']['firstName']);
  await prefs.setString('lastName', UserData['data']['lastName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
}

Future<void> WriteEmailVerification(email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
}

Future<void> WritepinVerification(otp) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('otp', otp);
}

Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata = await prefs.getString(Key);
  return mydata;
}

Future<bool> RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}

/*
Future<void> WriteEmailVerification(Email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', Email);
}
*/

showBase64Image(Base64String){
  UriData? data = Uri.parse(Base64String).data;
  Uint8List MyImage = data!.contentAsBytes();
  return MyImage;
}
