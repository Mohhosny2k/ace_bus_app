import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared_theme/shared_color.dart';

class Googel extends StatefulWidget {
 Googel({super.key});

  @override
  State<Googel> createState() => _GoogelState();
}

class _GoogelState extends State<Googel> {
  final Uri _url = Uri.parse('https://www.google.com/maps/');
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: ()async{
                        _launchUrl(_url);
                      } ,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: SharedColors.whiteColor,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/39/89/de/3989dedb6cfedb5f7adab991d1750ab0.jpg'),
            ),
          );
  }
    Future<void> _launchUrl($url) async {
    await launchUrl($url);
   
    }
  
}