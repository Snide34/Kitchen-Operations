import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'viewmodels/schedule_viewmodel.dart';
import 'viewmodels/live_orders_viewmodel.dart';
import 'viewmodels/shelf_life_viewmodel.dart';
import 'viewmodels/breakfast_menu_viewmodel.dart';
import 'views/schedule/schedule_view.dart';
import 'core/constants/app_colors.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  
  runApp(const KitchenOperationsApp());
}

class KitchenOperationsApp extends StatelessWidget {
  const KitchenOperationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kitchen Operations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ScheduleViewModel());
        Get.put(LiveOrdersViewModel());
        Get.put(ShelfLifeViewModel());
        Get.put(BreakfastMenuViewModel());
      }),
      home: const ScheduleView(),
    );
  }
}
