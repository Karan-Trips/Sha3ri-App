import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/widget/custom_error_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/Theme_mode/theme_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await locator.isReady<AppDB>();

  /// Disable debugPrint logs in production
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  // initialize firebase app
  //await Firebase.initializeApp();

  // set error builder widget
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return CustomErrorWidget(errorDetails: errorDetails);
  };

  // Fixing App Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(appRouter: locator<AppRouter>()));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) => ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            routerDelegate: widget.appRouter.delegate(),
            routeInformationParser: widget.appRouter.defaultRouteParser(),
            onGenerateTitle: (context) => S.of(context).applicationTitle,
            localizationsDelegates: const [S.delegate],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

void switchThemeMode() {
  themeNotifier.value = themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}
