import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

class Pinverificationscreen extends StatefulWidget {
  const Pinverificationscreen({super.key});

  @override
  State<Pinverificationscreen> createState() => _PinverificationscreenState();
}

class _PinverificationscreenState extends State<Pinverificationscreen> {
  bool Loading = false;

  Map<String, String> FormValue = {'otp': ''};

  onChenge(key, value) {
    setState(() {
      FormValue.update(key, (update) => value);
    });
  }

  onSubmit() async {
    if (FormValue['otp']!.length != 6) {
      ErrorToast('OPT required');
    } else {
      setState(() {
        Loading = true;
      });
      String? email = await ReadUserData('email');
      bool res = await VerifiOTPReqest(email, FormValue['otp']);
      if (res == true) {
        Navigator.pushNamed(context, '/setpassword');
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
                        Container(
                          child: Text('Pin verification:',
                              style:
                                  textstyle(31, FontWeight.w700, Colors.black)),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'A 6 digit verification pin has been sent to your email address',
                          style: textstyle(16, FontWeight.normal,
                              const Color.fromARGB(255, 158, 158, 158)),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        PinCodeTextField(
                          appContext: (context),
                          length: 6,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 50,
                            fieldWidth: 43,
                            inactiveBorderWidth: 1,
                            activeBorderWidth: 2,
                            selectedBorderWidth: 2,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            borderWidth: 0.5,
                            inactiveColor: Colors.grey,
                            activeColor: Colors.blue,
                            selectedColor: Colors.green,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.green,
                            activeFillColor: Colors.blue,
                          ),
                          animationType: AnimationType.fade,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: false,
                          onChanged: (value) {
                            onChenge('otp', value);
                          },
                          onCompleted: (v) {},
                        ),
                        const SizedBox(
                          height: 13,
                        ),

                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              onSubmit();
                            },
                            // ignore: sort_child_properties_last
                            child: Text(
                              'Next',
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
