import '../../user/user_view/login_screen.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../shared_theme/shared_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;
  final String? bottom;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
    required this.bottom,
  });
}

class onBoradingScreen extends StatefulWidget {
  
  onBoradingScreen( {super.key});
  var boradControl = PageController();
  bool isLast = false;
  List<BoardingModel> boardingList = [
    BoardingModel(
      image:
          'https://dq5r178u4t83b.cloudfront.net/wp-content/uploads/sites/55/2017/07/08143825/al-madinah.jpg',
      title: '\n\nWelecome \n to AceBus',
      body: 'the world is full of amazing  things to discover\n',
      bottom: 'Lets Go',
    ),
    BoardingModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQDOrI7Rr9FDjqWadKQBSPgvB3EMMTPjfgiFxDpJcmbO4QUpoV1KXZ6SK6AZlVu8CSwtY&usqp=CAU',
        title: '\n\nWe are\n the best',
        body: 'AceBus is the \#1 free App for rest in travel\n',
        bottom: 'Continue'),
    BoardingModel(
        image:
            'https://c4.wallpaperflare.com/wallpaper/485/286/548/cityscapes-religious-wallpaper-preview.jpg',
        title: '\n\nEasy\n Travel',
        body: 'Kaaba Sharif Makkah Madina',
        bottom: 'Lets Start'),
  ];
  @override
  State<onBoradingScreen> createState() => _onBoradingScreenState();
}

class _onBoradingScreenState extends State<onBoradingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.whiteColor,
      body: PageView.builder(
        onPageChanged: (int index) {
          if (index == widget.boardingList.length - 1) {
            setState(() {
              widget.isLast = true;
            });
            print('last');
          } else {
            print('no last');
            setState(() {
              widget.isLast = false;
            });
          }
        },
        controller: widget.boradControl,
        itemBuilder: (context, index) =>
            BuildBoradingScreen(widget.boardingList[index]),
        itemCount: widget.boardingList.length,
      ),
    );
  }

  Widget BuildBoradingScreen(BoardingModel model) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('${model.image}'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: textSkip(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HomeScreen()));
              }),
            ),
            Container(
              //10, 90, 50, 30 left, top, right, bottom
              padding: const EdgeInsets.fromLTRB(10, 200, 50, 30),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.title}',
                    //style: SharedFonts.primaryBlackFont,
                    softWrap: true,

                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${model.body}',
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SmoothPageIndicator(
                        controller: widget.boradControl,
                        count: widget.boardingList.length,
                        effect: ExpandingDotsEffect(
                            activeDotColor: SharedColors.blackWhiteColor,
                            dotColor: SharedColors.whiteColor,
                            dotHeight: 10.h,
                            expansionFactor: 4,
                            dotWidth: 10.w,
                            spacing: 5),
                      ),
                      // Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: SharedColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: Size(100, 50),
                        ),
                        onPressed: () {
                          if (widget.isLast) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => NavigationScreen()));
                          } else {
                            widget.boradControl.nextPage(
                                duration: Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        },
                        child: Text(
                          '${model.bottom}',
                          style: TextStyle(color: SharedColors.blackColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextButton textSkip(
  dynamic tap,
) {
  return TextButton(
      onPressed: tap,
      child: Text(
        'skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ));
}

IconButton rectangle(dynamic tap, Color color) {
  return IconButton(
      onPressed: tap,
      icon: Icon(
        Icons.rectangle_rounded,
        size: 26,
        color: color,
      ));
}
