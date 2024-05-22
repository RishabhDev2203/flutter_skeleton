import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/repository/ranking_repository.dart';
import 'package:flutter_skeleton/ui/ranking_page.dart';
import 'package:flutter_skeleton/utils/app_colors.dart';
import 'package:flutter_skeleton/utils/app_context.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'bloc/cubit/ranking_cubit.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RankingCubit(RankingRepository()),
      child: GlobalLoaderOverlay(
        overlayOpacity: 0.1,
        overlayColor: AppColors.transparent,
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: NavigationService.navigatorKey,
          // set property
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const RankingPage(),
        ),
      ),
    );
  }
}


