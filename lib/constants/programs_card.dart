// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../models/ProgramModel.dart';
import '../view/program details/program_details.dart';

class ProgramsCard extends StatelessWidget {
  int? id;
  ProgramsCard({super.key, this.id});

  ProgramModel? programModel;
  bool get = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetProgram(id: id!),
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
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: programModel!.episodes!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(
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
                                  image: NetworkImage("http://dot-tv.net/${programModel!.episodes![index].img}"),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
