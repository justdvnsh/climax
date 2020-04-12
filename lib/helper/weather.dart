
import 'package:flutter/material.dart';

class weather {

  var imageAndText = {};

  Map getImageAndText(int temp) {
    if (temp > 25) {
      imageAndText['image'] = "images/bg.jpg";
      imageAndText['text'] = "Time for an Ice Cream !";
      imageAndText['color'] = Colors.teal;
      return imageAndText;
    } else if (temp > 14) {
      imageAndText['image'] = "images/spring.jpg";
      imageAndText['text'] = "Time for tees and shorts !";
      imageAndText['color'] = Colors.yellow;
      return imageAndText;
    } else {
      imageAndText['image'] = "images/winter.jpg";
      imageAndText['text'] = "Time for coats and blazers !";
      imageAndText['color'] = Colors.black;
      return imageAndText;
    }
  }

}