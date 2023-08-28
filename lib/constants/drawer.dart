import 'package:dot/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/about/about_screen.dart';
import '../view/programs/programs_screen.dart';

Widget MyDrawer({
  required BuildContext context,
  bool inHome = false,
  bool inPrograms = false,
}){
  return Drawer(
    elevation: 0,
    backgroundColor: Colors.white,
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                if(inHome){
                  Navigator.pop(context);
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomeScreen())));
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("اخبار", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),

            SizedBox(height: 20.h,),

            InkWell(
              onTap: (){
                if(inPrograms){
                  Navigator.pop(context);
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const ProgramsScreen())));
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("برامج", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),

            SizedBox(height: 20.h,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const AboutScreen())));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("من نحن", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}