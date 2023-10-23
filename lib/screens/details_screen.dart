import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_states.dart';
import '../widgets/trip_card_widget.dart';

class DetailsScreen extends StatefulWidget {
  //const DetailsScreen({Key? key}) : super(key: key);
  static const screenRoute = '/TripDetails';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var modelRoute = ModalRoute.of(context)!.settings.arguments as Map;

    int price = modelRoute['price'];
    int id = modelRoute['id'];
    int people = modelRoute['people'];
    int stars = modelRoute['stars'];
    String image = modelRoute['image'];
    String description = modelRoute['description'];
    String location = modelRoute['location'];
    String name = modelRoute['name'];

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubitobject = AppCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.network(
                        image,
                        width: double.infinity,
                        height: 550,
                        fit: BoxFit.cover,
                      ),
                      TripCard(
                          id: id,
                          image: image,
                          price: price,
                          description: description,
                          location: location,
                          name: name,
                          people: people,
                          stars: stars),
                      Positioned(
                        top: 70,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                              color: Colors.white,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
