// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../view/news details/news_details_screen.dart';

class NewsCard1 extends StatelessWidget {

  String? image;
  String? text;
  String? date;
  int? id;
  NewsCard1({super.key, this.image, this.text, this.date, this.id});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => NewsDetailsScreen(id: id,))));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                    image: NetworkImage("http://dot.medsec.co/$image"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(width: 15.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 240.w, child: Text(text!, style: const TextStyle(fontWeight: FontWeight.w600), maxLines: 4, overflow: TextOverflow.ellipsis,)),
                SizedBox(height: 15.h,),
                Text(date!, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18.sp),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
