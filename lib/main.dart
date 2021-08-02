import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sorting_visualizer/provider/Algo.dart';
import 'package:sorting_visualizer/visualizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorting Visualizer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.pacificoTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.primaries[17],
          accentColor: Colors.white60),
      home: ChangeNotifierProvider(
          create: (context) => Algo(), child: Visualizer()),
    );
  }
}
