import 'package:assignment_app/custom_colors.dart';
import 'package:assignment_app/nav_bar_controller_screen.dart';
import 'package:assignment_app/providers/bottom_nav_provider.dart';
import 'package:assignment_app/providers/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder:
            (context, child) => MaterialApp(
              title: 'Assignment App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ).copyWith(
                scaffoldBackgroundColor: CustomColors.whiteColor,
                appBarTheme: AppBarTheme(
                  backgroundColor: CustomColors.whiteColor,
                  surfaceTintColor: CustomColors.whiteColor,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              home: child,
            ),
        child: NavBarControllerScreen(),
      ),
    );
  }
}
