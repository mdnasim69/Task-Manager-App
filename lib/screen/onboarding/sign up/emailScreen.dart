import 'package:flutter/material.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool Loading = false;

  Map<String, String> FormValue = {'email': ''};

  onsubmits() async {
    if (FormValue['email']!.length == 0) {
      ErrorToast('Enter your email');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await VerifiEmailReqest(FormValue['email']);
      if (res == true) {
        Navigator.pushNamed(context, '/pinV');
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  onChenge(key, value) {
    setState(() {
      FormValue.update(key, (update) => value);
    });
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
                          child: Text('Your Email Address:',
                              style:
                                  textstyle(31, FontWeight.w700, Colors.black)),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'A 6 digit verification pin send to your email address',
                          style: textstyle(16, FontWeight.normal,
                              const Color.fromARGB(255, 158, 158, 158)),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        TextField(
                          onChanged: (value) {
                            onChenge('email', value);
                          },
                          decoration: AppInputDecoration('Email'),
                        ),
                        const SizedBox(
                          height: 13,
                        ),

                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {onsubmits();},
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
