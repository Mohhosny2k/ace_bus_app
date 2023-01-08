import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/shared_theme/shared_color.dart';
import '../shared/shared_widget/bus_widget.dart';
import '../shared/shared_widget/googel.dart';
import 'bus_model.dart';

class BusDetails extends StatefulWidget {
  BusModel travel;
  BusDetails(this.travel,{super.key});

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          imageMap(),
          ListTile(
            leading: Text(
              'If you want to follow the route on google maps click here> ',
              style: TextStyle(fontSize: 11.2.sp),
            ),
            trailing: Googel(),
          ),
          Expanded(
              child: Container(
            // height: 500.h,
            padding: EdgeInsets.all(13),
            margin: EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
                color: SharedColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            // child:
            //Column(children: [
            //FlixbusWidget()
            // VerticalFlixbus(),
            // VerticalEurolines(),
            //VerticalBlablacar(),
            // ]),

            child: ListView(children: [
              BusWidget(widget.travel),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(color: SharedColors.whiteColor),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.directions_bus_rounded,
                          color: SharedColors.whiteColor,
                        ),
                        radius: 25,
                        backgroundColor: SharedColors.blackWhiteColor,
                      ),
                      title: Text('${widget.travel.fromLocation},${widget.travel.fromLocation}'),
                      subtitle: Text('${widget.travel.firstClock}:40 PM-${widget.travel.endClock}:15 PM'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 6),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                          color: SharedColors.whiteColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Image.asset('assets/images/circtwoarrow.png'),
                          radius: 25,
                          backgroundColor: SharedColors.whiteColor,
                        ),
                        title: Text('Muzdalifah,victoria coach station'),
                        subtitle: Text('Transfer,${widget.travel.clockTransferHour}h,10m'),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: SharedColors.blackColor,
                        ),
                        radius: 25,
                        backgroundColor: SharedColors.greyColor,
                      ),
                      title: Text(//'${widget.travel.toLocation
                      'Makkah,${widget.travel.toDistance}'),
                      subtitle: Text('Your destination'),
                    ),
                  ],
                ),
              ),
            ]),
          )),
        ],
      ),
    );
  }

  Container imageMap() {
    return Container(
      height: 210.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Makkah-and-Madinah.jpg'),
              fit: BoxFit.fill)),
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: SharedColors.blackColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
