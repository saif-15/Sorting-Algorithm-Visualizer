import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting_visualizer/provider/Algo.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Algo>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.primaries[3].shade100,
      width: width,
      height: height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Sorting Visualizer..",
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.primaries[3].shade700,
                    fontSize: (width / 100) * 3,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                DropdownButton(
                  elevation: 10,
                  value: provider.algorithm,
                  onChanged: (String val) {
                    print(val);
                    if (val == "Selection Sort")
                      provider.algorithm = "Selection Sort";
                    else if (val == "Bubble Sort")
                      provider.algorithm = "Bubble Sort";
                    else if (val == "Quick Sort")
                      provider.algorithm = "Quick Sort";
                    else if (val == "Insertion Sort")
                      provider.algorithm = "Insertion Sort";
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Quick Sort",
                      ),
                      value: "Quick Sort",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Selection Sort",
                      ),
                      value: "Selection Sort",
                    ),
                    DropdownMenuItem(
                      child: Text("Bubble Sort"),
                      value: "Bubble Sort",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Insertion Sort",
                      ),
                      value: "Insertion Sort",
                    ),
                  ],
                ),
                Slider(
                    inactiveColor: Colors.grey,
                    activeColor: Colors.primaries[3].shade400,
                    value: provider.slider,
                    min: 0.1,
                    max: 1,
                    onChanged: !provider.isPlaying
                        ? (n) {
                            provider.sampleSize = n;
                          }
                        : null),
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    padding: EdgeInsets.all(22.0),
                    primary: Colors.white70,
                    backgroundColor: Colors.primaries[3].shade400,
                  ),
                  child: Text(
                    "Generate Random Numbers",
                  ),
                  onPressed: provider.isPlaying
                      ? null
                      : () {
                          provider.randomize();
                        },
                ),
                SizedBox(
                  width: 10.0,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        elevation: 10,
                        padding: EdgeInsets.all(22.0),
                        backgroundColor: Colors.primaries[3].shade400,
                        primary: Colors.white70),
                    child: Text("Sort"),
                    onPressed: provider.isPlaying
                        ? null
                        : () {
                            provider.play();
                            //provider.quickSort(0, (provider.size - 1).round());
                          }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
