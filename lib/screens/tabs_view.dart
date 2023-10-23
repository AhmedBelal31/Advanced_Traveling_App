import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_states.dart';

import '../models/trips_model.dart';

class TabsView extends StatelessWidget {
  // const TabsView({Key? key}) : super(key: key);
  static const screenRoute = '/homescreen';

  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getTripsDetails(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubitObject = AppCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubitObject.changeNavBarItem(index);
              },
              currentIndex: cubitObject.currentIndex,
              elevation: 1,
              selectedItemColor: Colors.black54,
              unselectedItemColor: Colors.grey.withOpacity(0.5),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.apps,
                    ),
                    label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_rounded), label: ''),
              ],
            ),
            body: cubitObject.screens[cubitObject.currentIndex],
          );
        },
      ),
    );
  }
}
