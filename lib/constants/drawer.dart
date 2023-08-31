// ignore_for_file: non_constant_identifier_names

import 'package:dot/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/AllProgramsModel.dart';
import '../models/MainCategoriesModel.dart';
import '../view/about/about_screen.dart';
import '../view/all news/all_news_screen.dart';
import '../view/programs category/programs_category_screen.dart';
import '../view/programs/programs_screen.dart';

Widget MyDrawer({
  required BuildContext context,
  bool inHome = false,
  bool inPrograms = false,
  required MainCategoryItemList mainCategoriesModel,
  required AllProgramsItemList allProgramsItemList,
}){
  return Drawer(
    elevation: 0,
    backgroundColor: Colors.white,
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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

              Padding(
                padding: EdgeInsets.only(right: 25.w),
                child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => AllNewsScreen(id: mainCategoriesModel.mainCategoryModel![index].id!, title: mainCategoriesModel.mainCategoryModel![index].name!,))));
                        },
                        child: Text(mainCategoriesModel.mainCategoryModel![index].name!, style: TextStyle(fontSize: 18.sp),)),
                    separatorBuilder: (context, index) => SizedBox(height: 5.h,),
                    itemCount: mainCategoriesModel.mainCategoryModel!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                ),
              ),

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

              Padding(
                padding: EdgeInsets.only(right: 25.w),
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => ProgramsCategoryScreen(id: allProgramsItemList.allProgramsModel![index].id!, name: allProgramsItemList.allProgramsModel![index].name!,))));
                      },
                      child: Text(allProgramsItemList.allProgramsModel![index].name!, style: TextStyle(fontSize: 18.sp),)),
                  separatorBuilder: (context, index) => SizedBox(height: 5.h,),
                  itemCount: allProgramsItemList.allProgramsModel!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ),

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
    ),
  );
}