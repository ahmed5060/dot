import 'package:dot/cache_helper/cache_helper.dart';
import 'package:dot/constants/functions.dart';
import 'package:dot/view/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/bloc_observer.dart';
import 'bloc/cubit.dart';
import 'bloc/state.dart';
import 'dio/dio_helper.dart';
import 'package:permission_handler/permission_handler.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  await Firebase.initializeApp();

  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child:  BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) => ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (context, child) => MaterialApp(
            title: 'DOT',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "font"
            ),
            locale: const Locale('ar', 'AE'),
            supportedLocales: const [
              Locale('ar', 'AE'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: const HomeScreen(),
          ),
        ),
      ),
    );
  }
}