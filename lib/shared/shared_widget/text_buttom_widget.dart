import 'package:flutter/material.dart';

import '../shared_theme/shared_color.dart';

class TexxBottomWidget extends StatelessWidget {
  dynamic fun;
 // Function? fun=(){};
  final String? txt;
  final Color? colorText;
  final Color? colorBackground;
  final double? circular;
  final double? width;
  final double? height;

 TexxBottomWidget(this.fun, this.txt, this.colorText,
      this.colorBackground, this.circular, this.width, this.height,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:fun ,
      child: Text(
        txt!,
        style: TextStyle(color: colorText!), // Colors.white
      ),
      style: TextButton.styleFrom(
          // side: BorderSide(color: SharedColors.blackWhiteColor),
          backgroundColor: colorBackground!, //SharedColors.mainGrayColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circular!)), //20
          fixedSize: Size(width!,
              height!) //Size(MediaQuery.of(context).size.width * 1, 50),
          ),
    );
  }
}
