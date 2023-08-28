// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../constants/drawer.dart';
import '../../constants/programs_home_view.dart';
import '../../models/AllProgramsModel.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  AllProgramsItemList? allProgramsItemList;

  bool get = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetAllPrograms(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetAllProgramsSuccessState){
            allProgramsItemList = state.allProgramsItemList;
            get = true;
          }
        },
        builder: (BuildContext context, state) => Scaffold(
          backgroundColor: const Color.fromRGBO(3, 7, 43, 1.0),
          key: _scaffoldKey,
          drawer: MyDrawer(context: context, inPrograms: true),
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
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            title: Text(
              "البرامج",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () {
                setState(() {
                  get = false;
                });
                context.read<AppCubit>().GetAllPrograms();
                _refreshController.refreshCompleted();
              },
              header: const WaterDropHeader(),
              child: ConditionalBuilder(
                condition: get,
                fallback: (context) => const Center(child: CircularProgressIndicator()),
                builder: (context) => SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int i = 0; i < allProgramsItemList!.allProgramsModel!.length; i++)
                        ProgramsHomeView(child_id: allProgramsItemList!.allProgramsModel![i].child!.isNotEmpty? allProgramsItemList!.allProgramsModel![i].child![0].id : null, name: allProgramsItemList!.allProgramsModel![i].name, id: allProgramsItemList!.allProgramsModel![i].id),
                    ],
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
