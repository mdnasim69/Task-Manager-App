import 'package:flutter/material.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  Map<String, dynamic> FormValue = {'email': '', 'password': ''};
  bool Loading = false;

  onSubmit() async {
    if (FormValue['email']!.length == 0) {
      ErrorToast('Enter your email');
    } else if (FormValue['password']!.length == 0) {
      ErrorToast('Enter your password');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await LoginReqest(FormValue);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', (predicate) => false);
        //navigation
      }
    }
    setState(() {
      Loading = false;
    });
  }

  onChenge(value, key) {
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
            alignment: Alignment.center,
            child: Loading
                ? (const Center(
                    child: CircularProgressIndicator(),
                  ))
                : (SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Get Started With',
                            style:
                                textstyle(34, FontWeight.w700, Colors.black)),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'Developer Nasim',
                          style: textstyle(20, FontWeight.normal, Colors.grey),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: AppInputDecoration('Email'),
                          onChanged: (value) {
                            onChenge(value, 'email');
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: AppInputDecoration('Password'),
                          onChanged: (value) {
                            onChenge(value, 'password');
                          },
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
                              'Login',
                              style:
                                  textstyle(16, FontWeight.w400, Colors.white),
                            ),
                            style: AppButton(),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Center(
                          child: InkWell(
                            enableFeedback: true,
                            onTap: () {
                              Navigator.pushNamed(context, '/email');
                            },
                            child: Text(
                              'forget password',
                              style:
                                  textstyle(18, FontWeight.normal, Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account ?",
                              style: textstyle(16, FontWeight.normal,
                                  const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/registration');
                              },
                              child: Text(
                                'Sign Up',
                                style: textstyle(18, FontWeight.w400,
                                    const Color.fromARGB(255, 26, 216, 93)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
