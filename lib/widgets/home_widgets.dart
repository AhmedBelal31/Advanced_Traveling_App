import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/explore_item_model.dart';
import '../shared/component/component.dart';
import '../shared/theme/Colors.dart';

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;

  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height + radius * 2);

    canvas.drawCircle(offset + circleOffset, radius, paint);
    // TODO: implement paint
  }
}

Widget buildExploreListViewItem(ExploreItemModel exploreItemModel) => InkWell(
      onTap: () {},
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              exploreItemModel.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          defaultText(text: exploreItemModel.text),
        ],
      ),
    );
