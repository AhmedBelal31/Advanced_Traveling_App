import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/shared/component/component.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_states.dart';
import 'package:flutter_master_class_travel_app/shared/theme/Colors.dart';
import 'package:lottie/lottie.dart';

import '../const.dart';
import '../const.dart';
import '../const.dart';
import '../models/trips_model.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitobject = AppCubit.get(context);
        return ConditionalBuilder(
          condition:favoritesTrips.isNotEmpty,
          builder: (context) => Scaffold(
              backgroundColor: const Color(0xFFE5EAF5),
              body: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailsScreen.screenRoute,
                          arguments: {
                            'id': favoritesTrips[index].id,
                            'stars': favoritesTrips[index].stars,
                            'people': favoritesTrips[index].people,
                            'name': '${favoritesTrips[index].name} ',
                            'price': favoritesTrips[index].price,
                            'location': '${favoritesTrips[index].location} ',
                            'description':
                                '${favoritesTrips[index].description} ',
                            'image':
                                'http://mark.bslmeiyu.com/uploads/${favoritesTrips[index].img}',
                          });
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0),
                              ),
                              child: Image.network(
                                'http://mark.bslmeiyu.com/uploads/${favoritesTrips[index].img}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 250,
                              ),
                            ),
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.8),
                                  ],
                                  stops: const [0.1, 1],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Container(
                                  child: Text(
                                favoritesTrips[index].location!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                overflow: TextOverflow.fade,
                              )),
                            )
                          ],
                        ),
                        Container(
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${favoritesTrips[index].name}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                defaultText(
                                    text:
                                        '${favoritesTrips[index].stars} Stars'),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 20),
                                defaultText(
                                    text: '${favoritesTrips[index].price} \$',
                                    size: 18,
                                    color: AppColor.mainColor)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: favoritesTrips.length,
              )),
          fallback: (context) => Center(
              child: Container(
            child: Lottie.asset('assets/images/data.json'),
          )),
        );
      },
    );
  }
}

Widget defaultCardInfo(
  BuildContext context, {
  required String text,
  required IconData icon,
}) =>
    Row(
      children: [
        Icon(
          icon,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
