import 'package:ace_bus/bus/bus_view/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bus/bus_view/result_search_one_screen.dart';
import '../../bus/bus_view/result_search_three_screen.dart';
import '../../bus/bus_view/result_search_two_screen.dart';
import '../shared_theme/shared_color.dart';
import '../shared_theme/shared_font.dart';
import 'text_buttom_widget.dart';

class SearchWidget extends StatefulWidget {
  ///SearchWidget( this.travel,{super.key});
  //BusModel travel;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late String Date = 'Dates';
  String guests = '0';

  //String from = 'Madina,Prophet\'s Mosque';
  // String to = 'Makkah,Jamarat Bridge';
  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: Container(
          //  height: 200.h,
          // width:200.w,
          padding: EdgeInsets.all(40),
          margin: EdgeInsets.all(40),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 50),
                  padding: EdgeInsets.all(10),
                  primary: SharedColors.blackWhiteColor,
                ),
                child: Text('1-6-2022'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ResultSearchOneScreen()));
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 50),
                  padding: EdgeInsets.all(10),
                  primary: SharedColors.blackWhiteColor,
                ),
                child: Text('2-6-2022'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ResultSearchTwoScreen()));
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 50),
                  padding: EdgeInsets.all(10),
                  primary: SharedColors.blackWhiteColor,
                ),
                child: Text('3-6-2022'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ResultSearchThreeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      //  actions: <Widget>[
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           textStyle: Theme.of(context).textTheme.labelLarge,
      //         ),
      //         child: const Text('Disable'),
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           textStyle: Theme.of(context).textTheme.labelLarge,
      //         ),
      //         child: const Text('Enable'),
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //     ],
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        height: 335.h,
        width: 260.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: SharedColors.whiteColor,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 57.h,
              width: 50.w,
              child: ListTile(
                leading: Text(
                  'One-way ',
                  style: SharedFonts.subBlackFont,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Round trip  ',
                      style: SharedFonts.primaryGreyFont,
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.person, color: SharedColors.blackColor),
                      iconSize: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            child: Text('1'),
                            value: '1 ',
                          ),
                          PopupMenuItem(
                            child: Text('2'),
                            value: '2  ',
                          ),
                        ];
                      },
                      onSelected: (v) {
                        setState(() {
                          guests = v;
                        });
                      },
                    ),
                    //Spacer(),
                    // Icon(
                    //   Icons.person_sharp,
                    //   color: SharedColors.greyColor,
                    // ),
                    Text(
                      guests,
                      style: guests == '0'
                          ? SharedFonts.subGreyFont
                          : SharedFonts.subBlackFont,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              padding: EdgeInsets.all(5),
              height: 57.h,
              width: 50.w,
              decoration: BoxDecoration(
                border: Border.all(color: SharedColors.greyColor),
              ),
              child: ListTile(
                leading: Image.asset('assets/images/arrow.png'),
                title: Text(
                  'Madina,Prophet\'s Mosque',
                  style: SharedFonts.subBlackFont,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 57.h,
              padding: EdgeInsets.all(5),
              width: 50.w,
              decoration: BoxDecoration(
                border: Border.all(color: SharedColors.greyColor),
              ),
              child: ListTile(
                leading: Image.asset('assets/images/iconLocation.png'),
                title: Text(
                  'Makkah,Jamarat Bridge',
                  style: SharedFonts.subBlackFont,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 9),
              height: 57.h,
              width: 50.w,
              decoration: BoxDecoration(
                border: Border.all(color: SharedColors.greyColor),
              ),
              child: ListTile(
                leading: Icon(Icons.date_range_outlined),
                title: Text(
                  Date,
                  style: Date == 'Dates'
                      ? SharedFonts.subGreyFont
                      : SharedFonts.subBlackFont,
                ),
                trailing: PopupMenuButton(
                  //icon: Icon(Icons.calendar_view_day,
                  //     color: SharedColors.blackColor),
                  //iconSize: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        child: Text('1-6-2022'),
                        value: '1-6-2022 ',
                      ),
                      PopupMenuItem(
                        child: Text('2-6-2022'),
                        value: '2-6-2022  ',
                      ),
                      PopupMenuItem(
                        child: Text('3-6-2022'),
                        value: '3-6-2022  ',
                      ),
                    ];
                  },
                  onSelected: (v) {
                    setState(() {
                      Date = v;
                    });
                  },
                ),
                // onTap: () async {
                //   DateTime? selectData = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime(2022),
                //       firstDate: DateTime(2022),
                //       lastDate: DateTime(2023));
                //   try {
                //     setState(() {
                //       Date = selectData.toString().substring(0, 10);
                //     });
                //   } catch (e) {}
                // },
              ),
            ),
            TexxBottomWidget(
              () {
                //  _dialogBuilder(context);
                showProgressIndicator(context);
               
              },
              'Search',
              SharedColors.whiteColor,
              SharedColors.blackWhiteColor,
              25,
              MediaQuery.of(context).size.width * 1,
              50,
            )
          ],
        ));
  }
}
