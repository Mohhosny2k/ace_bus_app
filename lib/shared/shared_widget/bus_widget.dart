import '../../bus/bus_details.dart';
import '../../bus/bus_model.dart';
import '../shared_theme/shared_color.dart';
import '../shared_theme/shared_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BusWidget extends StatefulWidget {
  BusModel travel;
  BusWidget(this.travel,{super.key});

  @override
  State<BusWidget> createState() => _BusWidgetState();
}

class _BusWidgetState extends State<BusWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // Navigator.pushNamed(context, '/busdetails');
        Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BusDetails(widget.travel)));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 0),
        height: 205.h,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        //decoration: customBorder(widget.border),
        decoration: BoxDecoration(
          // border:
          //    Border.all(color: SharedColors.SecondMainGreenColor)
          //,
          borderRadius: BorderRadius.circular(15),
          color: SharedColors.whiteColor,
        ),
        child: Column(
          children: [
            ListTile(
              leading: Text(
                '${widget.travel.textOne}',
                style: TextStyle(
                    color:widget.travel.textOne=='BlaBlaCar'? SharedColors.blablaColor:widget.travel.textOne=='eurolines'?SharedColors.eurbusColor:SharedColors.flixbusColor,
                    fontSize: 20.h,
                    fontWeight: FontWeight.bold),
              ),
              // title: Container(
              //   padding: EdgeInsets.all(3),
              //   height: 20.h,
              //   width: 2.w,
              //   decoration: BoxDecoration(color: SharedColors.mainGreenColor),
              //   child: Text('  CHEAPEST',
              //       style: TextStyle(
              //         color: SharedColors.SecondMainGreenColor,
              //       )),
              // ),
           
              trailing: Text(
                '     \$${widget.travel.price}',
                style: SharedFonts.subBlackFont,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    '  ${widget.travel.firstClock}:40 PM __',
                    style: SharedFonts.subBlackFont,
                  ),
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: SharedColors.backGroundColor),
                    child: Text(' ${widget.travel.clockTransferHour}h 0m ', style: SharedFonts.subGreyFont),
                  ),
                  Text('__ ${widget.travel.endClock}:40 PM  ', style: SharedFonts.subBlackFont),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Text('  ${widget.travel.fromLocation}  ',
                      style: SharedFonts.subBlackFont, softWrap: true),
                  SizedBox(
                    width: 65.w,
                  ),
                  Text(
                    //'   ${widget.travel.toLocation} ',
                    'Makkah',
                    style: SharedFonts.subBlackFont,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${widget.travel.fromDistance}',
                      style: SharedFonts.subGreyFont,
                      softWrap: true), //المسجد النبوي

                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    '${widget.travel.toDistance} ',
                    style: SharedFonts.subGreyFont,
                    softWrap: true,
                  ), //جسر الجمرات
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              height: 50.h,
              margin: EdgeInsets.only(bottom: 0, top: 5),
              // decoration: BoxDecoration(color: SharedColors.yellowColor),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(6),
                      height: 30.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: SharedColors.greyColor),
                      child: Row(
                        children: [
                          Text('1 transfer'),
                          Icon(Icons.arrow_drop_down_outlined),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      padding: EdgeInsets.all(6),
                      height: 30.h,
                      width: 43.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: SharedColors.greyColor),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text('${widget.travel.numberPerson}'),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      padding: EdgeInsets.all(10),
                      height: 30.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: SharedColors.greyColor),
                      child: Text('One_way')),
                  Container(
                      margin: EdgeInsets.only(left: 3),
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                      height: 30.h,
                      width: 83.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: SharedColors.greyColor),
                      child: Row(
                        children: [
                          Text('Details'),
                          Icon(Icons.arrow_drop_up_outlined),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BoxDecoration customBorder(bool border) {
  //   return BoxDecoration(
  //     border:  widget.border
  //             ?Border.all(color: SharedColors.whiteColor)
  //             :   Border.all(color: SharedColors.SecondMainGreenColor),
  //              borderRadius: BorderRadius.circular(15),
  //         color: SharedColors.whiteColor,
  //   );
  // }
}
