// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../models/AllNewsByCategoryModel.dart';
import '../view/all news/all_news_screen.dart';
import 'news_card_2.dart';

class ProgramsView extends StatelessWidget {

  int? id;
  String? name;
  ProgramsView({super.key, this.id, this.name});

  AllNewsByCategoryModel? allNewsByCategoryModel;

  bool get = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetAllNewsByCategory(id: id, count: "all"),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetAllNewsByCategorySuccessState){
            allNewsByCategoryModel = state.allNewsByCategoryModel;
            get = true;
          }
        },
        builder: (BuildContext context, state) => ConditionalBuilder(
          condition: get,
          fallback: (context) => const Center(child: CircularProgressIndicator()),
          builder: (context) => ConditionalBuilder(
            condition: allNewsByCategoryModel!.data!.isNotEmpty,
            fallback: (context) => Container(),
            builder: (context) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => AllNewsScreen(id: id, title: name,))));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),),
                        Column(
                          children: [
                            Text("عرض الكل", style: TextStyle(color: Colors.grey, fontSize: 18.sp),),
                            Container(color: Colors.grey, height: 1.h, width: 70.w,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 230.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                          image: NetworkImage("http://dot-tv.net/${allNewsByCategoryModel!.data![0].img}"),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.transparent, Colors.black87]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(allNewsByCategoryModel!.data![0].head!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 15.h,),
                                  HtmlWidget(
                                    allNewsByCategoryModel!.data![0].body!.substring(0, 100),
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 260.h,
                  child: ListView.builder(
                    itemCount: allNewsByCategoryModel!.data!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => NewsCard2(
                      image: allNewsByCategoryModel!.data![index].img,
                      text: allNewsByCategoryModel!.data![index].head!,
                      id: allNewsByCategoryModel!.data![index].id!,
                    ),
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
