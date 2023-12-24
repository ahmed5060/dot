// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_string_interpolations
import 'dart:developer';

import 'package:dot/bloc/state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dio/dio_helper.dart';
import '../models/AdsModel.dart';
import '../models/AllNewsByCategoryModel.dart';
import '../models/AllProgramsModel.dart';
import '../models/MainCategoriesModel.dart';
import '../models/NewsDetailsModel.dart';
import '../models/ProgramModel.dart';
import '../models/SettingsModel.dart';
import '../models/SliderModel.dart';
import '../models/UrgentModel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  MainCategoryItemList? mainCategoriesModel;

  void GetMainCategories() {
    emit(GetMainCategoriesLoadingState());
    DioHelper.getData(
      url: 'api/categories',
    ).then((value) {
      mainCategoriesModel = MainCategoryItemList.fromJson(value.data);
      emit(GetMainCategoriesSuccessState(mainCategoriesModel!));
    }).catchError((error) {
      emit(GetMainCategoriesErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }

  AllNewsByCategoryModel? allNewsByCategoryModel;

  void GetAllNewsByCategory({
   int? id,
   var count,
  }) {
    emit(GetAllNewsByCategoryLoadingState());
    DioHelper.getData(
      url: 'api/news-of-category/$id?count=$count',
    ).then((value) {
      allNewsByCategoryModel = AllNewsByCategoryModel.fromJson(value.data);
      emit(GetAllNewsByCategorySuccessState(allNewsByCategoryModel!));
    }).catchError((error) {
      emit(GetAllNewsByCategoryErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


  SliderItemList? sliderItemList;

  void GetSlider() {
    emit(GetSliderLoadingState());
    DioHelper.getData(
      url: 'api/slider',
    ).then((value) {
      sliderItemList = SliderItemList.fromJson(value.data);
      emit(GetSliderSuccessState(sliderItemList!));
    }).catchError((error) {
      emit(GetSliderErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


  NewsDetailsModel? newsDetailsModel;

  void GetNewsDetails({
    int? id,
  }) {
    emit(GetNewsDetailsLoadingState());
    DioHelper.getData(
      url: 'api/mynews/$id',
    ).then((value) {
      newsDetailsModel = NewsDetailsModel.fromJson(value.data);
      emit(GetNewsDetailsSuccessState(newsDetailsModel!));
    }).catchError((error) {
      emit(GetNewsDetailsErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }

  SettingsModel? settingsModel;

  void GetSettings() {
    emit(GetSettingsLoadingState());
    DioHelper.getData(
      url: 'api/settings',
    ).then((value) {
      settingsModel = SettingsModel.fromJson(value.data);
      emit(GetSettingsSuccessState(settingsModel!));
    }).catchError((error) {
      emit(GetSettingsErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


  AllProgramsItemList? allProgramsItemList;

  void GetAllPrograms() {
    emit(GetAllProgramsLoadingState());
    DioHelper.getData(
      url: 'api/myprograms',
    ).then((value) {
      allProgramsItemList = AllProgramsItemList.fromJson(value.data);
      emit(GetAllProgramsSuccessState(allProgramsItemList!));
    }).catchError((error) {
      emit(GetAllProgramsErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


  ProgramModel? programModel;

  void GetProgram({
    int? id,
}) {
    emit(GetProgramLoadingState());
    DioHelper.getData(
      url: 'api/myprograms/$id',
    ).then((value) {
      programModel = ProgramModel.fromJson(value.data);
      emit(GetProgramSuccessState(programModel!));
    }).catchError((error) {
      emit(GetProgramErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


  AdsItemList? adsItemList;

  void GetAds() {
    emit(GetAdsLoadingState());
    DioHelper.getData(
      url: 'api/adds',
    ).then((value) {
      adsItemList = AdsItemList.fromJson(value.data);
      emit(GetAdsSuccessState(adsItemList!));
    }).catchError((error) {
      emit(GetAdsErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


  UrgentItemList? urgentItemList;

  void GetUrgent() {
    emit(GetUrgentLoadingState());
    DioHelper.getData(
      url: 'api/tickers',
    ).then((value) {
      urgentItemList = UrgentItemList.fromJson(value.data);
      emit(GetUrgentSuccessState(urgentItemList!));
    }).catchError((error) {
      emit(GetUrgentErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }

  void SendToken() async{
    emit(SendTokenLoadingState());

    String? tokenDevices = await FirebaseMessaging.instance.getToken();

    log(tokenDevices!);

    DioHelper.postData(
      url: 'api/token',
      data: {
        "token": tokenDevices
      }
    ).then((value) {
      emit(SendTokenSuccessState());
    }).catchError((error) {
      emit(SendTokenErrorState());
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }


}
