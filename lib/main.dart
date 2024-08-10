import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_arch/presentation/home_screen/blocs/watch_bloc.dart';
import 'package:mvp_arch/repos/helmet_repo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WatchBloc(WatchesRepository()),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}


