import '../../user/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bus_controller.dart';
import '../bus_state.dart';
import '../../shared/shared_widget/bus_widget.dart';
import '../../shared/shared_theme/shared_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultSearchThreeScreen extends StatefulWidget {
  const ResultSearchThreeScreen({super.key});
  @override
  State<ResultSearchThreeScreen> createState() => _ResultSearchThreeScreenState();
}

class _ResultSearchThreeScreenState extends State<ResultSearchThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusController, BusState>(builder: (context, state) {
      if (state is GetSearchThreeSixLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetSearchThreeSixErrorState) {
        return Center(
          child: Text('Some thing went wrong',
              style: SharedFonts.primaryBlackFont),
        );
      } else {
        return Scaffold(
           appBar: AppBar(
             leading: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
            backgroundColor: Colors.transparent,elevation: 0,centerTitle: true,title: Text('Search 3-6-2022',style: SharedFonts.subBlackFont,),),
          body: ListView.builder(
            itemCount: BlocProvider.of<BusController>(context).three.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return BusWidget(
                  BlocProvider.of<BusController>(context).three[index]);
            },
          ),
        );
      }
    });
  }
}
              // BlocBuilder<BusController, BusState>(builder: (context, state) {
              //   if (state is GetSearchTwoSixLoadingState) {
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state is GetSearchTwoSixErrorState) {
              //     return Center(
              //       child: Text('Some thing went wrong',
              //           style: SharedFonts.primaryBlackFont),
              //     );
              //   } else {
              //     return ListView.builder(
              //       itemCount: BlocProvider.of<BusController>(context).two.length,
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) {
              //         return BusWidget(
              //             BlocProvider.of<BusController>(context).two[index]);
              //       },
              //     );
              //   }
              // }),
              // BlocBuilder<BusController, BusState>(builder: (context, state) {
              //   if (state is GetSearchThreeSixLoadingState) {
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state is GetSearchThreeSixErrorState) {
              //     return Center(
              //       child: Text('Some thing went wrong',
              //           style: SharedFonts.primaryBlackFont),
              //     );
              //   } else {
              //     return ListView.builder(
              //       itemCount: BlocProvider.of<BusController>(context).three.length,
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) {
              //         return BusWidget(
              //             BlocProvider.of<BusController>(context).three[index]);
              //       },
              //     );
              //   }
              // }),
            
