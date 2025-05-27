import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/style/style.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundPicture(context),
          Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/nasimlogo.svg',
                height: 220,
                width: 280,
              ),
            ),
          )
        ],
      ),
    );
  }
}
