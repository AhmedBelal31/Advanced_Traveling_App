import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_cubit.dart';
import 'package:flutter_master_class_travel_app/shared/cubit/app_states.dart';
import 'package:flutter_master_class_travel_app/shared/theme/Colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../models/explore_item_model.dart';
import '../shared/component/component.dart';
import '../widgets/discover_places_items.dart';
import '../widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getTripsDetails(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => AppCubit(),
        builder: (context, state) {
          var cubitobject = AppCubit.get(context);

          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // Fluttertoast.showToast(
                                  //     msg: 'Go Back',
                                  //     //msg: "Go Back",
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.CENTER,
                                  //     timeInSecForIosWeb: 1,
                                  //     backgroundColor: AppColor.mainTextColor,
                                  //     textColor: Colors.white,
                                  //     fontSize: 16.0);
                                },
                                icon: Icon(Icons.menu)),
                            const Spacer(),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                //  color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Lottie.asset('assets/images/funny.json'),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: defaultLargeText(text: 'Discover '),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                              labelPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: CircleTabIndicator(
                                  color: AppColor.mainColor, radius: 4),
                              labelColor: Colors.black,
                              isScrollable: true,
                              dividerColor: Colors.white,
                              unselectedLabelColor:
                                  Colors.grey.withOpacity(0.5),
                              tabs: const [
                                Text('Places'),
                                Text('Inspiration'),
                                Text('Emotions'),
                              ]),
                        ),
                        const SizedBox(height: 30),
                        ConditionalBuilder(
                          // condition: cubitobject.tripsImages.isNotEmpty,
                          condition: state is GetDataState,
                          builder: (context) => SizedBox(
                            height: 300,
                            width: double.maxFinite,
                            child: TabBarView(
                              children: [
                                ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      DiscoverPlacesItems(
                                    image:
                                        'http://mark.bslmeiyu.com/uploads/${cubitobject.tripsImages[index]}',
                                    //image:'http://mark.bslmeiyu.com/uploads/${cubitobject.tripsData[0].img }',
                                    name: cubitobject.tripsData[index].name,
                                    id: cubitobject.tripsData[index].id,
                                    stars: cubitobject.tripsData[index].stars!,
                                    people:
                                        cubitobject.tripsData[index].people!,
                                    location:
                                        cubitobject.tripsData[index].location!,
                                    description: cubitobject
                                        .tripsData[index].description!,
                                    price: cubitobject.tripsData[index].price!,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                  itemCount: cubitobject.tripsImages.length,
                                ),
                                ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      DiscoverPlacesItems(
                                    image:
                                        'http://mark.bslmeiyu.com/uploads/${cubitobject.tripsImages[index]}',
                                    //image:'http://mark.bslmeiyu.com/uploads/${cubitobject.tripsData[0].img }',
                                    name: cubitobject.tripsData[index].name,
                                    id: cubitobject.tripsData[index].id,
                                    stars: cubitobject.tripsData[index].stars!,
                                    people:
                                        cubitobject.tripsData[index].people!,
                                    location:
                                        cubitobject.tripsData[index].location!,
                                    description: cubitobject
                                        .tripsData[index].description!,
                                    price: cubitobject.tripsData[index].price!,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                  itemCount: cubitobject.tripsImages.length,
                                ),
                                ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      DiscoverPlacesItems(
                                    image:
                                        'http://mark.bslmeiyu.com/uploads/${cubitobject.tripsImages[index]}',
                                    //image:'http://mark.bslmeiyu.com/uploads/${cubitobject.tripsData[0].img }',
                                    name: cubitobject.tripsData[index].name,
                                    id: cubitobject.tripsData[index].id,
                                    stars: cubitobject.tripsData[index].stars!,
                                    people:
                                        cubitobject.tripsData[index].people!,
                                    location:
                                        cubitobject.tripsData[index].location!,
                                    description: cubitobject
                                        .tripsData[index].description!,
                                    price: cubitobject.tripsData[index].price!,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                  itemCount: cubitobject.tripsImages.length,
                                ),
                              ],
                            ),
                          ),
                          fallback: (context) =>
                              Lottie.asset('assets/images/loading.json'),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            defaultLargeText(text: 'Explore More', size: 20),
                            const Spacer(),
                            defaultText(text: 'see all '),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                buildExploreListViewItem(exploreItems[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 30),
                            itemCount: exploreItems.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
