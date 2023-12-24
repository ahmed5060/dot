
import 'package:dot/models/AdsModel.dart';
import 'package:dot/models/UrgentModel.dart';

import '../models/AllNewsByCategoryModel.dart';
import '../models/AllProgramsModel.dart';
import '../models/MainCategoriesModel.dart';
import '../models/NewsDetailsModel.dart';
import '../models/ProgramModel.dart';
import '../models/SettingsModel.dart';
import '../models/SliderModel.dart';

abstract class AppStates {}

class InitialState extends AppStates {}

class GetMainCategoriesLoadingState extends AppStates {}

class GetMainCategoriesSuccessState extends AppStates {
  final MainCategoryItemList mainCategoriesModel;
  GetMainCategoriesSuccessState(this.mainCategoriesModel);
}

class GetMainCategoriesErrorState extends AppStates {
  final String error;
  GetMainCategoriesErrorState(this.error);
}

class GetAllNewsByCategoryLoadingState extends AppStates {}

class GetAllNewsByCategorySuccessState extends AppStates {
  final AllNewsByCategoryModel allNewsByCategoryModel;
  GetAllNewsByCategorySuccessState(this.allNewsByCategoryModel);
}

class GetAllNewsByCategoryErrorState extends AppStates {
  final String error;
  GetAllNewsByCategoryErrorState(this.error);
}

class GetSliderLoadingState extends AppStates {}

class GetSliderSuccessState extends AppStates {
  final SliderItemList sliderItemList;
  GetSliderSuccessState(this.sliderItemList);
}

class GetSliderErrorState extends AppStates {
  final String error;
  GetSliderErrorState(this.error);
}

class GetNewsDetailsLoadingState extends AppStates {}

class GetNewsDetailsSuccessState extends AppStates {
  final NewsDetailsModel newsDetailsModel;
  GetNewsDetailsSuccessState(this.newsDetailsModel);
}

class GetNewsDetailsErrorState extends AppStates {
  final String error;
  GetNewsDetailsErrorState(this.error);
}

class GetSettingsLoadingState extends AppStates {}

class GetSettingsSuccessState extends AppStates {
  final SettingsModel settingsModel;
  GetSettingsSuccessState(this.settingsModel);
}

class GetSettingsErrorState extends AppStates {
  final String error;
  GetSettingsErrorState(this.error);
}

class GetAllProgramsLoadingState extends AppStates {}

class GetAllProgramsSuccessState extends AppStates {
  final AllProgramsItemList allProgramsItemList;
  GetAllProgramsSuccessState(this.allProgramsItemList);
}

class GetAllProgramsErrorState extends AppStates {
  final String error;
  GetAllProgramsErrorState(this.error);
}

class GetProgramLoadingState extends AppStates {}

class GetProgramSuccessState extends AppStates {
  final ProgramModel programModel;
  GetProgramSuccessState(this.programModel);
}

class GetProgramErrorState extends AppStates {
  final String error;
  GetProgramErrorState(this.error);
}

class GetAdsLoadingState extends AppStates {}

class GetAdsSuccessState extends AppStates {
  final AdsItemList adsItemList;
  GetAdsSuccessState(this.adsItemList);
}

class GetAdsErrorState extends AppStates {
  final String error;
  GetAdsErrorState(this.error);
}

class GetUrgentLoadingState extends AppStates {}

class GetUrgentSuccessState extends AppStates {
  final UrgentItemList urgentItemList;
  GetUrgentSuccessState(this.urgentItemList);
}

class GetUrgentErrorState extends AppStates {
  final String error;
  GetUrgentErrorState(this.error);
}

class SendTokenLoadingState extends AppStates {}

class SendTokenSuccessState extends AppStates {}

class SendTokenErrorState extends AppStates {}