import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bag_it/utils/contants/global.dart';
import 'package:bag_it/model/cart_model.dart'; // Import CartModel
import 'package:bag_it/model/favorite_model.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final String itemDescription;

  const ItemDetailPage({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.itemDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[700],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Item Details',
          style: TextStyle(color: Colors.grey[700]),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 200),
            SizedBox(height: 16),
            Text(
              itemName,
              style: GoogleFonts.notoSerif(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              itemPrice,
              style: GoogleFonts.notoSerif(
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: GoogleFonts.notoSerif(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              itemDescription,
              style: GoogleFonts.notoSerif(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor, // Adjust the color as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    elevation: 5,
                  ),
                  onPressed: () {
                    final cart = Provider.of<CartModel>(context, listen: false);
                    final index = cart.shopItems.indexWhere((item) =>
                        item[0] == itemName &&
                        item[1] == itemPrice &&
                        item[2] == imagePath);
                    if (index != -1) {
                      cart.addItemToCart(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$itemName added to cart')),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Error adding $itemName to cart')),
                      );
                    }
                  },
                  child: Text('Add to Cart'),
                ),
                SizedBox(width: 16),
                Consumer<FavoriteModel>(
                  builder: (context, favoriteModel, child) {
                    final isFavorite = favoriteModel.isFavorite({
                      'name': itemName,
                      'price': itemPrice,
                      'image': imagePath,
                    });
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey[700],
                      ),
                      onPressed: () {
                        favoriteModel.toggleFavorite({
                          'name': itemName,
                          'price': itemPrice,
                          'image': imagePath,
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
