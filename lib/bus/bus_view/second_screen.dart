import '../bus_controller.dart';
import '../bus_state.dart';
import '../../shared/shared_widget/bus_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/shared_widget/horiz_tab_widget.dart';
import '../../shared/shared_theme/shared_color.dart';
import '../../shared/shared_theme/shared_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //String datetime = DateTime.now().toString();
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusController, BusState>(builder: (context, state) {
      if (state is GetTravelLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetTravelErrorState) {
        return Center(
          child: Text('Some thing went wrong',
              style: SharedFonts.primaryBlackFont),
        );
      } else {
        return RefreshIndicator(
          strokeWidth: 2.0,
          color: SharedColors.blackWhiteColor,
          onRefresh: () {
            // BlocProvider.of<CategoryController>(context).getCategories();
            return BlocProvider.of<BusController>(context).getBuss();
            //    return BlocProvider.of<BusController>(context).getRecommanded();
          },
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: SharedColors.backGroundColor,
              appBar: AppBar(
                backgroundColor: SharedColors.blackWhiteColor,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                   // Navigator.pushNamed(context, 'home');
                  },
                ),
                title: Column(
                  children: [
                    Text(' Madina to makkah\n',
                        style: TextStyle(color: SharedColors.whiteColor)),
                    Text(cdate),
                  ],
                ),
                centerTitle: true,
                toolbarHeight: 100.h,
                bottom: TabBar(
                    indicatorColor: SharedColors.blackWhiteColor,
                    isScrollable: true,
                    onTap: (index) {
                      print(index);
                      setState(() {
                        value = index;
                      });
                    },
                    labelStyle: TextStyle(letterSpacing: .5),
                    tabs: [
                      RecommandedWidget(value),
                      CheapestWidget(value),
                      FastWidget(value),
                    ]),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBarView(children: [
                  BlocBuilder<BusController, BusState>(
                      builder: (context, state) {
                    if (state is GetRecommandedLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetRecommandedErrorState) {
                      return Center(
                        child: Text('Some thing went wrong',
                            style: SharedFonts.primaryBlackFont),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: BlocProvider.of<BusController>(context)
                            .recommmanded
                            .length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return BusWidget(
                              BlocProvider.of<BusController>(context)
                                  .recommmanded[index]);
                        },
                      );
                    }
                  }),
                  BlocBuilder<BusController, BusState>(
                      builder: (context, state) {
                    if (state is GetCheapestLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetCheapestErrorState) {
                      return Center(
                        child: Text('Some thing went wrong',
                            style: SharedFonts.primaryBlackFont),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: BlocProvider.of<BusController>(context)
                            .chebus
                            .length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return BusWidget(
                              BlocProvider.of<BusController>(context)
                                  .chebus[index]);
                        },
                      );
                    }
                  }),
                  BlocBuilder<BusController, BusState>(
                      builder: (context, state) {
                    if (state is GetFastestLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetFastestErrorState) {
                      return Center(
                        child: Text('Some thing went wrong',
                            style: SharedFonts.primaryBlackFont),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: BlocProvider.of<BusController>(context)
                            .fasbus
                            .length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return BusWidget(
                              BlocProvider.of<BusController>(context)
                                  .fasbus[index]);
                        },
                      );
                    }
                  }),
                ]),
              ),
            ),
          ),
        );
      }
    });
  }
}
