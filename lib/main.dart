// import 'package:bird_discovery/views/auth/signin_screen.dart';
// import 'package:bird_discovery/views/home/widgets/bottom_nav_bar_screen.dart';
import 'package:bird_discovery/views/home/bird_analytics/bird_analytics_screen.dart';
import 'package:bird_discovery/views/onBoarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Bird Discovery',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Gilroy', useMaterial3: false),
          // home: SigninScreen(),
          home: const SplashScreen(),

          // home: const BottomNavBarScreen(),
          // home: const HomeScreen(),
          // home: const CollectionScreen(),
          // home: const ExploreScreen(),
          // home: const SettingsScreen(),
          // home: DiscoveryLearnScreen(),
          //home: BirdAnalyticsScreen(),
        );
      },
    );
  }
}
