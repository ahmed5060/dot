// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../constants/functions.dart';
import '../../models/AllNewsByCategoryModel.dart';
import '../news details/news_details_screen.dart';

class AllNewsScreen extends StatefulWidget {

  int? id;
  String? title;

  AllNewsScreen({super.key, this.id, this.title});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {

  AllNewsByCategoryModel? allNewsByCategoryModel;
  bool get = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetAllNewsByCategory(id: widget.id!, count: "all"),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetAllNewsByCategorySuccessState){
            allNewsByCategoryModel = state.allNewsByCategoryModel;
            get = true;
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
            automaticallyImplyLeading: false,
            title: Text(widget.title!, style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w600),),
          ),
          body: ConditionalBuilder(
            condition: get,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => ConditionalBuilder(
              condition: allNewsByCategoryModel!.data!.isNotEmpty,
              fallback: (context) => Container(),
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => NewsDetailsScreen(id: allNewsByCategoryModel!.data![0].id!))));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 230.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                              image: NetworkImage("http://dot-tv.net.orbit-mobile.co/${allNewsByCategoryModel!.data![0].img}"),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(allNewsByCategoryModel!.data![0].head!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 15.h,),
                                  HtmlWidget(
                                    allNewsByCategoryModel!.data![0].body!.substring(0, 100),
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h,),
                    
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => NewsDetailsScreen(id: allNewsByCategoryModel!.data![index].id!))));
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(8.r),
                              child: Container(
                                width: double.infinity,
                                height: 80.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r),
                                              image: DecorationImage(
                                                  image: NetworkImage("http://dot-tv.net.orbit-mobile.co/${allNewsByCategoryModel!.data![index].img}"),
                                                  fit: BoxFit.cover
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.w,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 230.w,
                                                child: Text(allNewsByCategoryModel!.data![index].head!, maxLines: 1,),
                                              ),
                                              SizedBox(height: 10.h,),
                                              Text(formatDateString2(allNewsByCategoryModel!.data![index].createdAt!.toString()), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 15.sp),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 3.w,
                                      height: 25.h,
                                      color: const Color.fromRGBO(28, 43, 92, 1.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(height: 10.h,), 
                          itemCount: allNewsByCategoryModel!.data!.length
                      ),
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
