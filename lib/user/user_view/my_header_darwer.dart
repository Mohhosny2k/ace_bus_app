import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/phone_auth/phone_auth_cubit.dart';
import '../../shared/shared_theme/shared_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final Uri _urlface = Uri.parse('https://www.facebook.com/mohhosny2000');
  final Uri _urllinkedin =
      Uri.parse('https://www.linkedin.com/in/mohamed-hosny-96164b174');
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneAuthCubit>(
    
      create: (context) => phoneAuthCubit,
      child: Column(
        children: [
          Container(
            color: SharedColors.blackWhiteColor,
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/personal.jpg'),
                    ),
                  ),
                ),
                Text(
                  'Mohamed Hosny',
                  style:
                      TextStyle(color: SharedColors.whiteColor, fontSize: 20),
                ),
                Text(
                  "mohhosny2k@gmail.com",
                  style: TextStyle(
                    color: SharedColors.greyColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.facebook,color: SharedColors.blackWhiteColor),
                title: Text('Facebook'),
                onTap: () async {
                  _launchUrl(_urlface);
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                ),
              ),
              ListTile(
                leading: Icon(Icons.work_outline_sharp,color: SharedColors.blackWhiteColor,),
                title: Text('Linkedin'),
                onTap: () async {
                  _launchUrl(_urllinkedin);
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout,color:Colors.red,),
                title: Text('logout'),
                 trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                ),
                onTap: () async {
                  await phoneAuthCubit.logOut();
                  Navigator.pushReplacementNamed(context,  '/login_screen');
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl($url) async {
    await launchUrl($url);
  }
}
