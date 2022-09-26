library image_slider;

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageSlider extends StatefulWidget {
  final String imagePath;
  final Slider slider;
  final int thumbWidth;
  final int thumbHeight;

  const ImageSlider(
      {super.key,
      required this.slider,
      required this.imagePath,
      this.thumbWidth = 50,
      this.thumbHeight = 50});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late MyShape myShape;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    ByteData byData = await rootBundle.load(widget.imagePath);
    final Uint8List bytes = Uint8List.view(byData.buffer);
    final ui.Codec codec = await ui.instantiateImageCodec(bytes,
        targetWidth: widget.thumbWidth, targetHeight: widget.thumbHeight);
    ui.Image image = (await codec.getNextFrame()).image;
    myShape = MyShape(image: image);
    setState(() {
      _loading = false;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_loading) Container(),
        if (!_loading)
          Center(
              child: SliderTheme(
            data: SliderThemeData(thumbShape: myShape),
            child: widget.slider,
          )),
      ],
    );
  }
}

class MyShape extends SliderComponentShape {
  ui.Image image;

  MyShape({required this.image});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final canvas = context.canvas;
    final imageWidth = image.width;
    final imageHeight = image.height;
    Offset imageOffset =
        Offset(center.dx - (imageWidth / 2), center.dy - (imageHeight / 2));
    Paint paint = Paint()..filterQuality = FilterQuality.high;
    canvas.drawImage(image, imageOffset, paint);
  }
}
