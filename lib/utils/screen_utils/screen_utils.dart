import 'package:flutter/cupertino.dart';

class ScreenUtils {
  //Responsive height
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  //Responsive Width
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
