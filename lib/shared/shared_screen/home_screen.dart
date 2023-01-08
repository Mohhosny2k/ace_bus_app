import '../../bus/bus_model.dart';

import '../../bus/bus_view/second_screen.dart';
import '../shared_theme/shared_color.dart';
import '../shared_theme/shared_font.dart';
import '../shared_widget/custom_appbar.dart';
import '../shared_widget/search_widget.dart';
import '../shared_widget/text_buttom_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
//  BusModel travel;
 HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.whiteColor,
      body: Column(
          //  padding: EdgeInsets.all(10),
          children: [
            SafeArea(top: true, child: CustomAppBar()),
            Flexible(
                child: ListView(
              children: [
                SearchWidget(),
                Text(
                  '  Cheap bus tickets\n',
                  style: SharedFonts.primaryBlackFont,
                ),
                Text(
                  '  form Madina to Makkah',
                  style: SharedFonts.primaryGreyFont,
                ),
                Container(
                  margin: EdgeInsets.only(top: 7, bottom: 9, left: 4, right: 4),
                  height: 150.h,
                  padding: EdgeInsets.all(10),
                  // width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color:SharedColors.mainGreenColor,// Colors.amber,
                  ),
                  child: Row(
                    children: [
                      VerticalDivider(
                        width: 22,
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                        color: SharedColors.greyColor,
                      ),
                      Container(
                        height: 150.h,
                        width: 150.w,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: SharedColors.SecondMainbackground,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Cheapest\n',
                              style: SharedFonts.primaryGreyFont,
                            ),
                            Text(
                              '\$125',
                              style: SharedFonts.subBlackFont,
                            ),
                            TexxBottomWidget(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SecondScreen()));
                            }, 'Find ticket', SharedColors.blackWhiteColor,
                                SharedColors.greyColor, 10, 100, 25),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 150.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: SharedColors.SecondMainbackground,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Average\n',
                              style: SharedFonts.primaryGreyFont,
                            ),
                            Text(
                              '\$146',
                              style: SharedFonts.subBlackFont,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_sharp,
                                  color: SharedColors.greyColor,
                                ),
                                Flexible(
                                    child: Text(
                                  'Find a cheap fare by book as for in advance',
                                  softWrap: true,
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  ' Bus this from Madina to Makkah',
                  style: SharedFonts.primaryGreyFont,
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            )),
          ]),
    );
  }
}
