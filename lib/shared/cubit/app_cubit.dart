import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/network/dio_helper.dart';
import '../../const.dart';
import '../../models/trips_model.dart';
import '../../network/endPoints.dart';
import '../../screens/details_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/personal_screen.dart';
import '../../screens/search_screen.dart';
import '../../screens/favorites_screen.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    SearchScreen(),
    PersonalScreen(),
  ];
  int currentIndex = 0;

  void changeNavBarItem(int index) {
    currentIndex = index;
    emit(ChangeScreenState());
    if (index == 1) {
      print('Test for Favorite ${favoritesTrips}');
      emit(FavoritesUpdatedState());
    }
  }

  int selectedIndex = -1;

  void changeContainerStyle(int index) {
    selectedIndex = index;
    emit(ChangeContainerStyleState());
  }

  Color changeTextColor(int index) {
    return selectedIndex == index ? Colors.white : Colors.black;
  }

  Color changeContainerColor(int index) {
    return selectedIndex == index ? Colors.black : Colors.grey.shade200;
  }

  // var favoriteIcon = Icons.favorite_border;
  // bool isFavorite = true;
  //
  // changeFavoriteIcon() {
  //   favoriteIcon = isFavorite ? Icons.favorite : Icons.favorite_border;
  //   isFavorite = !isFavorite;
  //   emit(ChangeFavoriteIconState());
  // }

  TripDetailsModel? tripDetailsModel;

  List tripsImages = [];
  List<dynamic> tripsData = [];

  void getTripsDetails() {
    DioHelper.getData(url: TripDetails).then((value) {
      for (int i = 0; i < value.data.length; i++) {
        tripDetailsModel = TripDetailsModel.fromJson(value.data[i]);

        tripsImages.add(tripDetailsModel!.img);
      }

      tripsData = value.data
          .map((modelItem) => TripDetailsModel.fromJson(modelItem))
          .toList();
      //print(tripsData[0].img);

      emit(GetDataState());
    }).catchError((error) {
      debugPrint("Error IS ${error.toString()}");
    });
  }

  void manageFavorites(int tripId) {
    emit(FavoritesLoadingState());
    final existingIndex =
        favoritesTrips.indexWhere((trip) => trip.id == tripId);

    if (existingIndex >= 0) {
      favoritesTrips.removeAt(existingIndex);
    } else {
      favoritesTrips.add(tripsData.firstWhere((trip) => trip.id == tripId));
    }

    emit(FavoritesUpdatedState());
  }

  bool isInFavorite(int id) {
    return favoritesTrips.any((trip) => trip.id == id);
  }
}
