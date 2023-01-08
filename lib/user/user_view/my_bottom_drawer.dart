import 'package:url_launcher/url_launcher.dart';
//import '../shared_theme/shared_color.dart';
import 'package:ace_bus/shared/shared_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MyDrawerWidget extends StatefulWidget {
//   const MyDrawerWidget({super.key});

//   @override
//   State<MyDrawerWidget> createState() => _MyDrawerWidgetState();
// }

// class _MyDrawerWidgetState extends State<MyDrawerWidget> {
//   final Uri _url = Uri.parse('https://www.facebook.com/mohhosny2000');
//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: [
// ListTile(
//   leading: Icon(Icons.facebook),
//   title: Text('Facebook'),
//   onTap: () async{
//       _launchUrl(_url);
//   },
// ),
//     ],);
//   }
  
// }
  Future<void> _launchUrl($url) async {
    await launchUrl($url);
   
    }
    final Uri _url = Uri.parse('https://www.facebook.com/mohhosny2000');
Widget MybottomDrawer(){
  return ListView(children: [
ListTile(
  leading: Icon(Icons.facebook),
  title: Text('Facebook'),
  onTap: () async{
      _launchUrl(_url);
  },
),
    ],);
  }
  
