
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared_theme/shared_color.dart';
import '../shared_theme/shared_font.dart';

//int value = 0;

class RecommandedWidget extends StatefulWidget {
  int? value;
  RecommandedWidget(this.value, {super.key});

  @override
  State<RecommandedWidget> createState() => _RecommandedWidgetState();
}

class _RecommandedWidgetState extends State<RecommandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 0),
        margin: EdgeInsets.all(7),
        height: 40.h,
        width: 200.w,
        decoration: BoxDecoration(
            color:
                widget.value == 0 ? SharedColors.whiteColor : SharedColors.greyColor,
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          ' Recommanded 8 trips',
          style: SharedFonts.subBlackFont,
        ));
  }
}

class CheapestWidget extends StatefulWidget {
  int? value;
 CheapestWidget(this.value, {super.key});

  @override
  State<CheapestWidget> createState() => _CheapestWidgetState();
}

class _CheapestWidgetState extends State<CheapestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 12, top: 10, bottom: 10, left: 12),
        margin: EdgeInsets.all(7),
        height: 40.h,
        width: 170.w,
        decoration: BoxDecoration(
            color:
                widget. value == 1 ? SharedColors.whiteColor : SharedColors.greyColor,
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          ' Cheapest \$125',
          style: SharedFonts.subBlackFont,
        ));
  }
}

class FastWidget extends StatefulWidget {
  int? value;
  FastWidget(this.value, {super.key});

  @override
  State<FastWidget> createState() => _FastWidgetState();
}

class _FastWidgetState extends State<FastWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 12, bottom: 10, top: 10, left: 12),
        margin: EdgeInsets.all(7),
        height: 40.h,
        width: 170.w,
        decoration: BoxDecoration(
            color:
                widget. value == 2 ? SharedColors.whiteColor : SharedColors.greyColor,
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          ' Fastest 4h 20m',
          style: SharedFonts.subBlackFont,
        ));
  }
}
