import 'package:flutter/material.dart';
import 'package:task_manager/api/api.dart';
import 'package:task_manager/style/style.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  bool Loading = false;

  Map FormValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "Cpassword":"",
  };

  onSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email required');
    } else if (FormValues['firstName']!.length == 0) {
      ErrorToast('First name required');
    } else if (FormValues['lastName']!.length == 0) {
      ErrorToast('Last name required');
    } else if (FormValues['mobile']!.length == 0) {
      ErrorToast('Mobile Number required');
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('password required');
    } else if(FormValues['password'] !=FormValues['Cpassword']){
      ErrorToast('Confirm password should be same!');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await RegistrationReqest(FormValues);
      if (res == true) {
         Navigator.pushNamedAndRemoveUntil(context, "/login", (predicate) => false);
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  onChenge(key, value) {
    setState(() {
      FormValues.update(key, (update) => value);
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
            padding: const EdgeInsets.all(32),
            child:Loading?(Center(child:CircularProgressIndicator(),)):( SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Registration:',
                      style: textstyle(34, FontWeight.w700, Colors.black)),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    'Developer Nasim',
                    style: textstyle(20, FontWeight.normal, Colors.grey),
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
                  TextField(
                    onChanged: (value) {
                      onChenge('firstName', value);
                    },
                    decoration: AppInputDecoration('First Name'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextField(
                    onChanged: (value) {
                      onChenge('lastName', value);
                    },
                    decoration: AppInputDecoration('Last Name'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextField(
                    onChanged: (value) {
                      onChenge('mobile', value);
                    },
                    decoration: AppInputDecoration('Mobile'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextField(
                    onChanged: (value) {
                      onChenge('password', value);
                    },
                    decoration: AppInputDecoration('Password'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextField(
                    onChanged: (value) {
                      onChenge('Cpassword', value);
                    },
                    decoration: AppInputDecoration('Confirm Password'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {onSubmit();},
                      // ignore: sort_child_properties_last
                      child: Text(
                        'Registration',
                        style: textstyle(16, FontWeight.w400, Colors.white),
                      ),
                      style: AppButton(),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account ?",
                        style: textstyle(16, FontWeight.normal,
                            const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Sign In',
                          style: textstyle(18, FontWeight.w400,
                              const Color.fromARGB(255, 26, 216, 93)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
            )
        ],
      ),
    );
  }
}
