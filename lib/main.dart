import 'package:flutter/material.dart';
import 'package:task_manager/screen/onboarding/sign%20in/loginScreen.dart';
import 'package:task_manager/screen/onboarding/sign%20in/splashScreen.dart';
import 'package:task_manager/screen/onboarding/sign%20up/emailScreen.dart';
import 'package:task_manager/screen/onboarding/sign%20up/pinVerificationScreen.dart';
import 'package:task_manager/screen/onboarding/sign%20up/registrationScreen.dart';
import 'package:task_manager/screen/onboarding/sign%20up/setPasswordScreen.dart';
import 'package:task_manager/screen/profile/profileUpdetScreen.dart';
import 'package:task_manager/screen/task/cancelTaskScreen.dart';
import 'package:task_manager/screen/task/completedTaskScreen.dart';
import 'package:task_manager/screen/task/home.dart';
import 'package:task_manager/screen/task/newTaskScreen.dart';
import 'package:task_manager/screen/task/progressTaskScreen.dart';
import 'package:task_manager/screen/task/taskCreateScreen.dart';
import 'package:task_manager/utility/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');

  if (token == null) {
    runApp( const TaskApp("/login"));
  } else {
    runApp( const TaskApp("/home"));
  }
}

class TaskApp extends StatelessWidget {
  final String firstRoute;
   const TaskApp(this.firstRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Task app',
      initialRoute: firstRoute,
      routes: {
        '/': (context) => const Splashscreen(),
        '/registration': (context) => const Registrationscreen(),
        '/login': (context) => const Loginscreen(),
        '/email': (context) => const EmailScreen(),
        '/pinV': (context) => const Pinverificationscreen(),
        '/setpassword': (context) => const Setpasswordscreen(),
        '/profileUpdate': (context) => const Profileupdetscreen(),
        '/cancelTask': (context) => const Canceltaskscreen(),
        '/progressTask': (context) => const Progresstaskscreen(),
        '/completedTask': (context) => const Completedtaskscreen(),
        '/newTask': (context) => const Newtaskscreen(),
        '/home': (context) =>  homeScreen(),
        "/TaskCreate":(context)=>Taskcreatescreen(),
      },
    );
  }
}
