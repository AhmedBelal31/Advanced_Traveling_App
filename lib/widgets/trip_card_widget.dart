import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/models/trips_model.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_states.dart';
import '../shared/component/component.dart';
import '../shared/theme/Colors.dart';

class TripCard extends StatelessWidget {
  //const TripCard({Key? key}) : super(key: key);

  int id, stars, price, people;

  String name, location, description, image;

  TripCard({
    required this.id,
    required this.stars,
    required this.people,
    required this.name,
    required this.price,
    required this.location,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppCubit()..getTripsDetails(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubitobject = AppCubit.get(context);
          return Positioned(
            //top: 260,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                margin: const EdgeInsets.only(top: 290),
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: defaultLargeText(text: name, size: 25),
                        ),
                        Spacer(),
                        defaultLargeText(
                            text: '$price\$',
                            color: AppColor.mainColor,
                            size: 25),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        defaultText(text: location, size: 14)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    index < stars
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                  )),
                        ),
                        const SizedBox(width: 10),
                        defaultText(
                            text: '($stars)', color: AppColor.textColor2)
                      ],
                    ),
                    const SizedBox(height: 20),
                    defaultLargeText(text: 'People', size: 25),
                    defaultText(text: 'Numbers of people in your Group'),
                    const SizedBox(height: 20),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => InkWell(
                          onTap: () {
                            cubitobject.changeContainerStyle(index);
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color:
                                      cubitobject.changeContainerColor(index),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: defaultText(
                                  text: '${index + 1}',
                                  color: cubitobject.changeTextColor(index))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    defaultLargeText(text: 'Description', size: 25),
                    const SizedBox(height: 10),
                    defaultText(
                      text: description,
                      size: 14,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconButton(
                            onPressed: () {
                              cubitobject.manageFavorites(id);
                            },
                            icon: cubitobject.isInFavorite(id)
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: responsiveButton(
                              isResponsive: false,
                              function: () {},
                              width: size.width),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
