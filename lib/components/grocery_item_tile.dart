import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;

  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,

    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // item image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 5),
            child: Image.asset(
              imagePath,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),

          // item name
          Text(
            itemName,
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          MaterialButton(
            onPressed: onPressed,

            child: Container(
              height: 40,
              width: 70,
              color: Colors.black12,
              child: Center(
                child: Text(

                  '\$' + itemPrice,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
