// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../models/NewsDetailsModel.dart';

class NewsDetailsScreen extends StatelessWidget {

  int? id;
  NewsDetailsScreen({super.key, this.id});

  NewsDetailsModel? newsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetNewsDetails(id: id),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetNewsDetailsSuccessState){
            newsDetailsModel = state.newsDetailsModel;
          }
        },
        builder: (BuildContext context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,))
            ],
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: Text("التفاصيل", style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w600),),
          ),
          body: ConditionalBuilder(
            condition: state is GetNewsDetailsSuccessState,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: double.infinity,
                      height: 180.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage("http://dot.medsec.co/${newsDetailsModel!.img!}"),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(newsDetailsModel!.head!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20.sp),),
                    ),

                    HtmlWidget(
                      newsDetailsModel!.body!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
