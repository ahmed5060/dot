// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dot/cache_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../constants/drawer.dart';
import '../../constants/programs_view.dart';
import '../../constants/slider_card.dart';
import '../../constants/view.dart';
import '../../models/AdsModel.dart';
import '../../models/AllProgramsModel.dart';
import '../../models/MainCategoriesModel.dart';
import '../../models/SliderModel.dart';
import '../../models/UrgentModel.dart';
import '../live/live_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  MainCategoryItemList? mainCategoriesModel;
  SliderItemList? sliderItemList;
  AllProgramsItemList? allProgramsItemList;
  AdsItemList? adsItemList;
  UrgentItemList? urgentItemList;
  bool get_main_cat = false;
  bool get_slider = false;
  bool get_programs = false;
  bool get_ads = false;
  bool get_urgent = false;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool x = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String urgent = "";

  bool isFirst = true;

  @override
  void initState() {
    var first = CacheHelper.getData(key: 'isFirst');
    if(first != null) {
      isFirst = first;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        if(isFirst){
          return AppCubit()..GetMainCategories()..GetSlider()..GetAllPrograms()..GetAds()..GetUrgent()..SendToken();
        }else{
          return AppCubit()..GetMainCategories()..GetSlider()..GetAllPrograms()..GetAds()..GetUrgent();
        }
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is SendTokenSuccessState){
            isFirst = false;
            CacheHelper.saveData(
              key: 'isFirst',
              value: isFirst,
            ).then((value) {
            }).catchError((error) {
              print(error.toString());
            });
          }
          if(state is GetMainCategoriesSuccessState){
            mainCategoriesModel = state.mainCategoriesModel;
            get_main_cat = true;
          }
          if(state is GetSliderSuccessState){
            sliderItemList = state.sliderItemList;
            get_slider = true;
          }
          if(state is GetAllProgramsSuccessState){
            allProgramsItemList = state.allProgramsItemList;
            get_programs = true;
          }
          if(state is GetAdsSuccessState){
            adsItemList = state.adsItemList;
            get_ads = true;
          }
          if(state is GetUrgentSuccessState){
            urgentItemList = state.urgentItemList;
            urgent = "";
            for(int i = 0; i < urgentItemList!.urgentModel!.length; i++) {
              urgent += "${urgentItemList!.urgentModel![i].head!} -- ";
            }
          }
        },
        builder: (BuildContext context, state) => Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          drawer: get_main_cat && get_programs? MyDrawer(context: context, inHome: true, mainCategoriesModel: mainCategoriesModel!, allProgramsItemList: allProgramsItemList!) : const CircularProgressIndicator(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const LiveScreen())));
                },
                icon: Icon(
                  Icons.live_tv,
                  color: Colors.red,
                  size: 40.sp,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: (){
                _scaffoldKey.currentState!.openDrawer();
              },
              icon:  const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            title: Image.asset("assets/images/icon.png", scale: 4,),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              color: Colors.red,
              child: TextScroll(
                urgent,
                mode: TextScrollMode.endless,
                textDirection: TextDirection.rtl,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: get_main_cat && get_slider && get_ads,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () {
                setState(() {
                  get_main_cat = false;
                  get_slider = false;
                });
                context.read<AppCubit>()..GetMainCategories()..GetSlider();
                _refreshController.refreshCompleted();
              },
              header: const WaterDropHeader(),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    if(sliderItemList!.sliderModel!.isNotEmpty) Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CarouselSlider.builder(
                        itemCount: sliderItemList!.sliderModel!.length,
                        options: CarouselOptions(
                          height: 180.h,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          viewportFraction: 0.8,
                          initialPage: 0,
                        ),
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => SliderCard(id: sliderItemList!.sliderModel![itemIndex].id, image: sliderItemList!.sliderModel![itemIndex].img, cat_name: sliderItemList!.sliderModel![itemIndex].categories![0].name, head: sliderItemList!.sliderModel![itemIndex].head, body: sliderItemList!.sliderModel![itemIndex].body,),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border.symmetric(
                            horizontal: BorderSide(
                              color: Colors.white,
                            )),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mainCategoriesModel!.mainCategoryModel!.length,
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
                                    mainCategoriesModel!.mainCategoryModel![index].name!,
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

                    if(mainCategoriesModel!.mainCategoryModel![selectedIndex].child!.isNotEmpty && !x) for(int i = 0; i < mainCategoriesModel!.mainCategoryModel![selectedIndex].child!.length; i++)
                      ViewScreen(name: mainCategoriesModel!.mainCategoryModel![selectedIndex].child![i].name!, id: mainCategoriesModel!.mainCategoryModel![selectedIndex].child![i].id!),

                    if(mainCategoriesModel!.mainCategoryModel![selectedIndex].child!.isEmpty && !x) ProgramsView(id: mainCategoriesModel!.mainCategoryModel![selectedIndex].id!, name: mainCategoriesModel!.mainCategoryModel![selectedIndex].name!),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text("اعلانات", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),),
                        ],
                      ),
                    ),

                    if(adsItemList!.adsModel!.isNotEmpty) CarouselSlider.builder(
                      itemCount: adsItemList!.adsModel!.length,
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        viewportFraction: 0.8,
                        initialPage: 0,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("http://dot-tv.net/${adsItemList!.adsModel![itemIndex].img}"),
                              fit: BoxFit.contain
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 50.h,),
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
