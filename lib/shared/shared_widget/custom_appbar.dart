import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared_theme/shared_font.dart';
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 130.h, 
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/istockphotobackgroundmap.jpg',
            ),
            fit: BoxFit.fill),
      ),
      child: ListTile(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Spacer(),
            Image.asset('assets/images/logo.png'),
            Text(
              'Find Cheap bus tickets',
              style: SharedFonts.primaryGreyFont,
            )
          ],
        ),
        trailing: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 66.h,
          width: 46.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: pickedImage == null
                ? DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQORhBE_-B7JnAoMdNtLe2kthebd_BkOH1Vw&usqp=CAU'),
                    fit: BoxFit.fill,
                  )
                : DecorationImage(
                    image: FileImage(pickedImage!), fit: BoxFit.fill),
          ),
          // child: IconButton(
          //   icon: Icon(Icons.add_a_photo),
          //   color: SharedColors.mainGreenColor,
          //   iconSize: 10.sp,
          //   onPressed: () {
          //     showModalBottomSheet(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return Container(
          //             height: 200.0.h,
          //             child: ListTile(
          //               leading: InkWell(
          //                 onTap: () {
          //                   getImg(ImageSource.camera);
          //                 },
          //                 child: Text('Camera',
          //                     style: SharedFonts.primaryBlackFont),
          //               ),
          //               trailing: InkWell(
          //                 onTap: () {
          //                   getImg(ImageSource.gallery);
          //                 },
          //                 child: Text('Gallery',
          //                     style: SharedFonts.primaryBlackFont),
          //               ),
          //             ),
          //           );
          //         });
          //   },
          // ),
        ),
      ),
    );
  }

  // void getImg(ImageSource source) async {
  //   XFile? img = await ImagePicker().pickImage(source: source);
  //   try {
  //     setState(() {
  //       pickedImage = File(img!.path);
  //     });
  //   } catch (e) {}
  // }
}
