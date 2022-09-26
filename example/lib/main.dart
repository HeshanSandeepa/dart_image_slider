import 'package:flutter/material.dart';
import 'package:image_slider/image_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Image Slider Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentValue = 0.0;

  Slider _getSlider() {
    return Slider(
      value: _currentValue,
      max: 100,
      divisions: 10,
      label: _currentValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentValue = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ImageSlider(
          slider: _getSlider(),
          imagePath: 'assets/button.png',
        ));
  }
}
