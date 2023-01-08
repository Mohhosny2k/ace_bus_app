import '../bus/bus_view/second_screen.dart';
import '../shared/shared_widget/bus_widget.dart';
import 'navigation_controller.dart';
import 'navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/shared_screen/profiel_screen.dart';
import '../shared/shared_screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../shared/shared_theme/shared_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  //int selectedScreen = 0;
  //int currentIndex = 0;
  // final List screens = [
  //   HomeScreen(),
  //   SecondScreen(), // BusWidget(),//ThiredScreen(),
  //   ProfielScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationController, NavigationStates>(
      builder: (context, state) {
        if (state is NavigationChangeState) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 60.h,
                  decoration: BoxDecoration(
                    // border: Border.all(color: SharedColors.greyColor),
                    color: SharedColors.blackWhiteColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: BottomNavyBar(
                    backgroundColor: SharedColors.blackWhiteColor,
                    selectedIndex: state.currentIndex, //currentIndex,
                    onItemSelected: (index) {
                      // setState(() {
                      //   currentIndex = index;
                      // });
                   BlocProvider.of<NavigationController>(context).move(index);
                    },
                    items: <BottomNavyBarItem>[
                      BottomNavyBarItem(
                          icon: Icon(
                            Icons.home,
                            color: SharedColors.whiteColor,
                          ),
                          title: Text('Home'),
                          activeColor: SharedColors.whiteColor,
                          inactiveColor: SharedColors.blackWhiteColor),
                      BottomNavyBarItem(
                          icon: Icon(
                            Icons.card_travel_outlined,
                            color: SharedColors.whiteColor,
                          ),
                          title: Text('Travel'),
                          activeColor: SharedColors.whiteColor,
                          inactiveColor: SharedColors.blackWhiteColor),
                      BottomNavyBarItem(
                          icon: Icon(
                            Icons.person_outline_sharp,
                            color: SharedColors.whiteColor,
                          ),
                          title: Text('Acount'),
                          activeColor: SharedColors.whiteColor,
                          inactiveColor: SharedColors.blackWhiteColor),
                    ],
                  ),
                ),
                body: state.selectedScreen //screens[currentIndex],
                ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
