import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

var BaseURL = 'https://task.teamrabbil.com/api/v1';
var RequestHeader = {'Content-Type': 'application/json'};

Future<bool> LoginReqest(FormValue) async {
  var URL = Uri.parse('${BaseURL}/login');
  var ReqestBody = json.encode(FormValue);
  var response = await http.post(URL, body: ReqestBody, headers: RequestHeader);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
    await WriteUserData(Body);
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}

Future<bool> RegistrationReqest(FormValue) async {
  var URL = Uri.parse('$BaseURL/registration');
  var ReqestBody = json.encode(FormValue);
  var response = await http.post(URL, body: ReqestBody, headers: RequestHeader);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    //StatusCode == 200 && Body['status'] == 'success'
    SuccessToast('Reqest Sucess ');
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}

Future<bool> VerifiEmailReqest(email) async {
  var URL = Uri.parse('${BaseURL}/RecoverVerifyEmail/$email');
  var response = await http.get(URL, headers: RequestHeader);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Success ');
   await WriteEmailVerification(email);
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}

Future<bool> VerifiOTPReqest(email, OTP) async {
  var URL = Uri.parse('${BaseURL}/RecoverVerifyOTP/$email/$OTP');
  var response = await http.get(URL, headers: RequestHeader);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
   await WritepinVerification(OTP);
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}

Future<bool> SetPasswordReqeat(FormValue) async {
  var URL = Uri.parse('$BaseURL/RecoverResetPass');
  var ReqestBody = json.encode(FormValue);
  var response = await http.post(URL, body: ReqestBody, headers: RequestHeader);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}

Future<List> TaskListReqest(status) async {
  var URL = Uri.parse('${BaseURL}/listTaskByStatus/$status');

  String? token =await ReadUserData('token');
  var RequestHeader1 = {'Content-Type': 'application/json','token':'$token'};
  var response = await http.get(URL, headers: RequestHeader1);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
    return Body['data'];
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return [];
  }
}


Future<bool> TaskCreateReqest(FormValue) async {
  var URL = Uri.parse('${BaseURL}/createTask');
 var ReqestBody = json.encode(FormValue);
  String? token =await ReadUserData('token');
  var RequestHeader1 = {'Content-Type': 'application/json','token':'$token'};
  var response = await http.post(URL, headers: RequestHeader1,body:ReqestBody);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}



Future<bool> TaskDeletReqest(id) async {
  var URL = Uri.parse('${BaseURL}/deleteTask/$id');

  String? token =await ReadUserData('token');
  var RequestHeader1 = {'Content-Type': 'application/json','token':'$token'};
  var response = await http.get(URL, headers: RequestHeader1);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}

Future<bool> TaskStatusReqest(id,status) async {
  var URL = Uri.parse('${BaseURL}/updateTaskStatus/$id/$status');

  String? token =await ReadUserData('token');
  var RequestHeader1 = {'Content-Type': 'application/json','token':'$token'};
  var response = await http.get(URL, headers: RequestHeader1);
  var StatusCode = response.statusCode;
  var Body = json.decode(response.body);
  if (StatusCode == 200 && Body['status'] == 'success') {
    SuccessToast('Reqest Sucess ');
    return true;
  } else {
    ErrorToast('Reqest Fail ! try again ');
    return false;
  }
}
