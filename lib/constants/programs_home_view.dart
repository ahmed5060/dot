// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../models/ProgramModel.dart';
import '../view/program details/program_details.dart';
import '../view/programs category/programs_category_screen.dart';

class ProgramsHomeView extends StatelessWidget {

  int? child_id;
  int? id;
  String? name;
  ProgramsHomeView({super.key, this.child_id, this.name, this.id});

  ProgramModel? programModel;
  bool get = false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetProgram(id: child_id),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetProgramSuccessState){
            programModel = state.programModel;
            get = true;
          }
        },
        builder: (BuildContext context, state) => ConditionalBuilder(
          condition: get,
          fallback: (context) => const Center(child: CircularProgressIndicator()),
          builder: (context) => ConditionalBuilder(
            condition: programModel!.episodes!.isNotEmpty,
            fallback: (context) => Container(),
            builder: (context) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => ProgramsCategoryScreen(id: id, name: name,))));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              color: const Color.fromRGBO(17, 202, 152, 1.0),
                              height: 45.h,
                              width: 5.w,
                            ),
                            SizedBox(width: 10.w,),
                            Text(name!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.sp),),

                          ],
                        ),
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

                ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => ProgramDetails(video: programModel!.episodes![index].video, name: programModel!.episodes![index].head,))));
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(10.r),
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(23, 29, 64, 1.0),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.w,
                                height: 110.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                      image: NetworkImage("http://dot-tv.net.orbit-mobile.co/public${programModel!.episodes![index].img}"),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(programModel!.episodes![index].head!, style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),),

                                    SizedBox(height: 15.h,),

                                    SizedBox(
                                      width: 200.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 30.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.r),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: const Center(child: Text("التفاصيل", style: TextStyle(color: Colors.white),)),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  color: const Color.fromRGBO(17, 202, 152, 1.0),
                                  height: 45.h,
                                  width: 5.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: programModel!.episodes!.length > 4 ? 4 : programModel!.episodes!.length
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
