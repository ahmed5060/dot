// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../view/news details/news_details_screen.dart';

class NewsCard2 extends StatelessWidget {

  String? image;
  String? text;
  int? id;
  NewsCard2({super.key, this.image, this.text, this.id});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => NewsDetailsScreen(id: id,))));
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            width: 240.w,
            height: 240.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 240.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
                    image: DecorationImage(
                        image: NetworkImage("http://dot.medsec.co/$image"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: HtmlWidget(text!, textStyle: const TextStyle(fontWeight: FontWeight.bold),),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 4.h,
                    width: 50.w,
                    color: const Color.fromRGBO(28, 43, 92, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
