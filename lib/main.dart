import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/network/dio_helper.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';
import 'network/bloc_observer.dart';
import 'screens/details_screen.dart';
import 'screens/tabs_view.dart';
import 'screens/welcome_screen.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveling App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Jannah'),
      debugShowCheckedModeBanner: false,

      // home: TabsView(),
      routes: {
        '/': (context) => WelcomeScreen(),
        TabsView.screenRoute: (context) => TabsView(),
        DetailsScreen.screenRoute: (context) => DetailsScreen(),
      },
    );
  }
}
