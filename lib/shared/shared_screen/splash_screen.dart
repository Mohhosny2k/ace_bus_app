import 'package:flutter/material.dart';

import '../shared_theme/shared_color.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first = true;
  @override
  void didChangeDependencies() async {
    if (first) {
      first = false;
      await Future.delayed(Duration(seconds: 3), () async {
        Navigator.pushNamed(context, 'onBorading');
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.blackWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.directions_bus_sharp,
              color: SharedColors.mainGreenColor,
              size: 200.0,
            ),
          ),
          Image(image: AssetImage(
              'assets/images/logo.png',
            ),)
       
     
        ],
      ),
    );
  }
}
