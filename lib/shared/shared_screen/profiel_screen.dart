import '../shared_theme/shared_color.dart';
import '../shared_theme/shared_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../user/user_view/my_bottom_drawer.dart';
import '../../user/user_view/my_header_darwer.dart';

class ProfielScreen extends StatelessWidget {
  ProfielScreen({Key? key}) : super(key: key);
  double radius = 112;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: SharedColors.backGroundColor,
        child: ListView(
          children: [
            MyHeaderDrawer(),
         
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF2B475E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 112,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 110,
              backgroundImage: AssetImage('assets/images/personal.jpg'),
            ),
          ),
          Text(
            'Mohamed Hosny',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Pacifico',
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
              color: Color(0xFF6C8090),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Color(0xFF6C8090),
            thickness: 1,
            indent: 60,
            endIndent: 60,
            height: 10,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                size: 32,
                color: Color(0xFF2B475E),
              ),
              title: Text(
                '(+20)1114553201',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.mail,
                size: 32,
                color: Color(0xFF2B475E),
              ),
              title: Text(
                'mohhosny2k@gmail.com',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
