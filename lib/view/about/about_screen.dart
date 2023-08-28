import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../models/SettingsModel.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  SettingsModel? settingsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetSettings(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetSettingsSuccessState){
            settingsModel = state.settingsModel;
          }
        },
        builder: (BuildContext context, state) =>Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,))
            ],
            title: Text("من نحن", style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w600),),
          ),
          body: ConditionalBuilder(
            condition: state is GetSettingsSuccessState,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color.fromRGBO(18, 27, 66, 1.0),
                      ),
                      child: Center(
                          child: CircleAvatar(
                            radius: 80.r,
                            backgroundColor: Colors.white,
                            backgroundImage: const AssetImage("assets/images/logo.png"),
                          ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color.fromRGBO(28, 43, 92, 1.0),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: const Color.fromRGBO(28, 43, 92, 1.0),
                          child: Image.asset("assets/images/icons8-exclamation-mark-30.png"),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color.fromRGBO(28, 43, 92, 1.0),
                        ),
                      ),
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("العنوان", style: TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(28, 43, 92, 1.0),),),
                  ),
                  if(settingsModel!.address != null) Text(settingsModel!.address!),

                  SizedBox(height: 20.h,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("القمر", style: TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(28, 43, 92, 1.0),),),
                  ),
                  if(settingsModel!.sate != null) Text(settingsModel!.sate!),

                  SizedBox(height: 20.h,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("التردد الافقي", style: TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(28, 43, 92, 1.0),),),
                  ),
                  if(settingsModel!.vFreq != null) Text(settingsModel!.vFreq!),

                  SizedBox(height: 20.h,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("التردد العمودي", style: TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(28, 43, 92, 1.0),),),
                  ),
                  if(settingsModel!.hFreq != null) Text(settingsModel!.hFreq!),

                  SizedBox(height: 20.h,),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color.fromRGBO(28, 43, 92, 1.0),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: const Color.fromRGBO(28, 43, 92, 1.0),
                          child: Icon(Icons.phone, color: Colors.white, size: 30.sp,),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color.fromRGBO(28, 43, 92, 1.0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("موبايل", style: TextStyle(fontSize: 18.sp, color: const Color.fromRGBO(28, 43, 92, 1.0),),),
                  ),
                  if(settingsModel!.phone != null) Text(settingsModel!.phone!),

                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
