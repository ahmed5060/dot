// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../models/AllNewsByCategoryModel.dart';
import '../view/all news/all_news_screen.dart';
import 'functions.dart';
import 'news_card_1.dart';

class ViewScreen extends StatelessWidget {

  String? name;
  int? id;
  ViewScreen({super.key, this.name, this.id});

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

                ListView.builder(
                  itemCount: allNewsByCategoryModel!.data!.length > 4 ? 4 : allNewsByCategoryModel!.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NewsCard1(
                    image: allNewsByCategoryModel!.data![index].img,
                    text: allNewsByCategoryModel!.data![index].head,
                    date: formatDateString2(allNewsByCategoryModel!.data![index].createdAt!.toString()),
                    id: allNewsByCategoryModel!.data![index].id!,
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
