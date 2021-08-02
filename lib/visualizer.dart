import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting_visualizer/provider/Algo.dart';

import 'myappbar.dart';

class Visualizer extends StatefulWidget {
  Visualizer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Visualizer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var algo = Provider.of<Algo>(context);
    var heightRatio = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          MyAppBar(),
          Container(
            height: heightRatio * 0.90,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: BarPainter(
                  numbers: algo.number, heightRatio: heightRatio * 0.8),
            ),
          ),
        ],
      ),
    ));
  }
}

class BarPainter extends CustomPainter {
  final List<int> numbers;
  final double heightRatio;

  BarPainter({this.numbers, this.heightRatio});

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width / numbers.length;
    var height = size.height;
    var brushpaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width;

    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] < 500 * 0.2)
        brushpaint.color = Colors.primaries[3].shade100;
      else if (numbers[i] < 500 * 0.4)
        brushpaint.color = Colors.primaries[3].shade300;
      else if (numbers[i] < 500 * 0.6)
        brushpaint.color = Colors.primaries[3].shade500;
      else if (numbers[i] < 500 * 0.8)
        brushpaint.color = Colors.primaries[3].shade700;
      else if (numbers[i] < 500)
        brushpaint.color = Colors.primaries[3].shade900;

      canvas.drawLine(Offset(i * width, height),
          Offset(i * width, height - numbers[i].ceilToDouble()), brushpaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
