import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/pageview_model.dart';
import '../screens/tabs_view.dart';
import '../shared/component/component.dart';
import '../shared/theme/Colors.dart';

class WelcomeScreenItem extends StatelessWidget {
  //const WelcomeScreenItem({Key? key}) : super(key: key);

  final PageViewModel pageViewModel;
  final PageController pageViewControl;

  const WelcomeScreenItem(
      {super.key, required this.pageViewModel, required this.pageViewControl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(pageViewModel.image),
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultLargeText(text: 'Trips'),
                      defaultLargeText(
                        text: 'Mountain',
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SmoothPageIndicator(
                    controller: pageViewControl,
                    axisDirection: Axis.vertical,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: AppColor.mainColor,
                    ),
                    count: pageViewScreens.length,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: defaultText(text: pageViewModel.subTitle, size: 14),
              ),
              const SizedBox(height: 40),
              responsiveButton(
                width: 120,
                function: () {
                  Navigator.pushReplacementNamed(
                    context,
                    TabsView.screenRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
