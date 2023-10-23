import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';

import '../screens/details_screen.dart';

class DiscoverPlacesItems extends StatelessWidget {
  //const buildDiscoverListView({Key? key}) : super(key: key);

  final int id, stars, price, people;

  final String name, location, description, image;

  DiscoverPlacesItems({
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.screenRoute, arguments: {
          'id': id,
          'stars': stars,
          'people': people,
          'name': name,
          'price': price,
          'location': location,
          'description': description,
          'image': image,
        });
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 200,
              height: 300,
            ),
            // child: FadeInImage.assetNetwork(
            //   placeholder: 'assets/images/loading.gif',
            //   image: image,
            //   fit: BoxFit.cover,
            //   width: 200,
            //   height: 300,
            // ),
          )
        ],
      ),
    );
  }
}
