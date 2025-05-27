// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/utility/utility.dart';

void ErrorToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void SuccessToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

SvgPicture backgroundPicture(context) {
  return SvgPicture.asset(
    'assets/images/background.svg',
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 0.5),
      ),
      border: const OutlineInputBorder(),
      labelText: label);
}

ButtonStyle AppButton() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: const Color.fromARGB(255, 55, 198, 59),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}

DecoratedBox AppDropDownStyle(child) {
  return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30), child: child));
}

ButtonStyle AppStatusButtonStyle(btnColor) {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
  );
}

Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
      ),
    ),
  );
}

TextStyle textstyle(double? siz, FontWeight, Colors) {
  return GoogleFonts.sora(
      textStyle:
          TextStyle(fontSize: siz, color: Colors, fontWeight: FontWeight));
}

BottomNavigationBar appBottomNav(currentIndex, parameter) {
  return BottomNavigationBar(
    elevation: 30,
    backgroundColor: Colors.white,
    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined), label: 'New'),
      BottomNavigationBarItem(
          icon: Icon(Icons.timelapse_outlined), label: 'Progress'),
      BottomNavigationBarItem(
          icon: Icon(Icons.domain_verification_rounded), label: 'Completed'),
      BottomNavigationBarItem(
          icon: Icon(Icons.cancel_presentation_rounded), label: 'Canceled'),
    ],
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.black,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    iconSize: 30,
    onTap: parameter,
  );
}

ListView TaskListView(TaskItem, DeleteItem,editStatus) {
  return ListView.builder(
    itemBuilder: (context, index) {
      Color color1 = const Color.fromARGB(255, 196, 35, 217);
      if (TaskItem[index]['status'] == 'New') {
        color1 = const Color.fromARGB(255, 58, 191, 43);
      } else if (TaskItem[index]['status'] == 'Progress') {
        color1 = Colors.pinkAccent;
      } else if (TaskItem[index]['status'] == 'Completed') {
        color1 = const Color.fromARGB(255, 26, 198, 178);
      } else if (TaskItem[index]['status'] == 'Canciled') {
        color1 = Colors.red;
      }
      return Card(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        elevation: 3,
        shadowColor: Colors.black,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${TaskItem[index]['title']} :',
                style: textstyle(18, FontWeight.w600, Colors.black),
              ),
              Text(
                TaskItem[index]['description'], //
                style: textstyle(14, FontWeight.w400, Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                TaskItem[index]['createdDate'], //
                style: textstyle(10, FontWeight.bold, Colors.blue),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 70,
                    // ignore: sort_child_properties_last
                    child: Text(
                      TaskItem[index]['status'],
                      style: textstyle(10, FontWeight.bold, Colors.black),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: color1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28,
                          width: 32,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              editStatus(TaskItem[index]['_id']);
                            },
                            child: const Icon(
                              Icons.edit_calendar_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width:8,),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          height: 28,
                          width: 32,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              DeleteItem(TaskItem[index]['_id']);
                            },
                            child: const Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
    itemCount: TaskItem.length,
  );
}

AppBar TaskAppBar(context, profileInfo) {
  return AppBar(
    backgroundColor: Colors.yellow,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(48, 42, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.memory(
                showBase64Image(
                  profileInfo['photo'],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${profileInfo['firstName']} ${profileInfo['lastName']}",
                  style: textstyle(18, FontWeight.w600, Colors.black)),
              Text(
                '${profileInfo['email']}',
                style: textstyle(12, FontWeight.normal, Colors.blue),
              )
            ],
          )
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('LOG OUT !'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        RemoveToken();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (predicate) => false);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              });
        },
        icon: const Icon(
          Icons.output_outlined,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
