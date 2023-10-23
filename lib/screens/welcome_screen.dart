import 'package:flutter/material.dart';
import '../models/pageview_model.dart';
import '../widgets/welcome_screen_item.dart';

class WelcomeScreen extends StatelessWidget {
  //const WelcomeScreen({Key? key}) : super(key: key);
  var pageViewControl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: pageViewControl,
        itemBuilder: (context, index) => WelcomeScreenItem(
          pageViewModel: pageViewScreens[index],
          pageViewControl: pageViewControl,
        ),
        itemCount: pageViewScreens.length,
      ),
    );
  }
}
