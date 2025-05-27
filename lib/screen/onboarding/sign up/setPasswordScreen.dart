import 'package:flutter/material.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

class Setpasswordscreen extends StatefulWidget {
  const Setpasswordscreen({super.key});

  @override
  State<Setpasswordscreen> createState() => _SetpasswordscreenState();
}

class _SetpasswordscreenState extends State<Setpasswordscreen> {
  bool Loading = false;

  Map<String, String> FormValue = {
    'email': '',
    'OTP': '',
    'password': '',
    'Cpassword': ''
  };

  onChenge(key, value) {
    setState(() {
      FormValue.update(key, (update) => value);
    });
  }

  @override
  void initState() {
    storeData();
    super.initState();
  }

  storeData() async {
    String? email = await ReadUserData('email');
    String? OTP = await ReadUserData('otp');
    onChenge('email', email);
    onChenge('OTP', OTP);
  }

  onSubmit() async {
    if (FormValue['password']!.length == 0) {
      ErrorToast('Password required');
    } else if (FormValue['password'] != FormValue['Cpassword']) {
      ErrorToast('Confirm password should be same ');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await SetPasswordReqeat(FormValue);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (predicate) => false);
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundPicture(context),
          Container(
              padding: const EdgeInsets.all(32),
              child: Loading
                  ? (const Center(
                      child: CircularProgressIndicator(),
                    ))
                  : (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Set Password',
                            style:
                                textstyle(34, FontWeight.w700, Colors.black)),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'Minimum length password 8 character with Letter and number combination',
                          style: textstyle(15, FontWeight.normal, Colors.grey),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          onChanged: (value) {
                            onChenge('password', value);
                          },
                          decoration: AppInputDecoration('Password'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          onChanged: (value) {
                            onChenge('Cpassword', value);
                          },
                          decoration: AppInputDecoration('Confirm Password'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              onSubmit();
                            },
                            // ignore: sort_child_properties_last
                            child: Text(
                              'Confirm',
                              style:
                                  textstyle(16, FontWeight.w400, Colors.white),
                            ),
                            style: AppButton(),
                          ),
                        )
                      ],
                    )))
        ],
      ),
    );
  }
}
