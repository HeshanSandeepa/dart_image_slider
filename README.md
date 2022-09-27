<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

* image_slider facilitates adding any assets image as the thumb shape of a slider.
* provided Slider is entirely configurable as needed with it's on custom theme.
* only the assets image path and subjected slider are need to be provided.


## Getting started

import image_slider as follows,

import 'package:image_slider/image_slider.dart';

## Usage

01. Create Slider

    Slider _getSlider() {
        return Slider(
        value: _currentValue,
        max: 100,
        divisions: 10,
        label: _currentValue.round().toString(),
        onChanged: (double value) {
            setState(() {
            });
        },
    );
    }
    
02. Place the image in the assets folder & define assets in pubspec.yaml file

03. provide slider & image path to the image_slider as follows,

    ImageSlider(
        slider: _getSlider(),
        imagePath: 'assets/button.png',
    )

## Additional information

This packages supports  only for assets images for the moments.

