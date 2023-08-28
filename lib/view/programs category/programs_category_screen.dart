// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../constants/programs_card.dart';
import '../../models/ProgramModel.dart';

class ProgramsCategoryScreen extends StatefulWidget {
  int? id;
  String? name;
  ProgramsCategoryScreen({super.key, this.id, this.name});

  @override
  State<ProgramsCategoryScreen> createState() => _ProgramsCategoryScreenState();
}

class _ProgramsCategoryScreenState extends State<ProgramsCategoryScreen> {

  ProgramModel? programModel;
  bool get = false;
  int selectedIndex = 0;
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetProgram(id: widget.id!),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetProgramSuccessState){
            programModel = state.programModel;
            get = true;
          }
        },
        builder: (BuildContext context, state) => Scaffold(
          backgroundColor: const Color.fromRGBO(3, 7, 43, 1.0),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(3, 7, 43, 1.0),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ))
            ],
            automaticallyImplyLeading: false,
            title: Text(
              widget.name!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: ConditionalBuilder(
            condition: get,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => Column(
              children: [

                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(3, 7, 43, 1.0),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: programModel!.child!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            x = true;
                            selectedIndex = index;
                            Future.delayed(const Duration(milliseconds: 100), () {
                              setState(() {
                                x = false;
                              });
                            });
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: selectedIndex == index ? const Color.fromRGBO(42, 64, 155, 1) : const Color.fromRGBO(241, 241, 241, 1)
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                programModel!.child![index].name!,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == index ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h,),

                if(x) Container(),

                if(!x) ProgramsCard(id: programModel!.child![selectedIndex].id!),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
