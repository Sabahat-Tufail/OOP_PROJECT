import 'package:bag_it/network/network.dart';
import 'package:bag_it/utils/screen_utils/screen_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bag_it/components/grocery_item_tile.dart';
import 'package:provider/provider.dart';

import '../../model/cart_model.dart';
import 'cart_page.dart';
import 'products_detailed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> images = [
    "assets/images/apple.png",
    "assets/images/bakery_snacks.png",
    "assets/images/banana.png",
   "assets/images/beef_bone.png",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtils.screenHeight(context);
    final screenWidth = ScreenUtils.screenWidth(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.location_on,
              color: Colors.grey[700],
            ),
          ),
          title: Text(
            'Sydney, Australia',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          centerTitle: false,

        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage();
              },
            ),
          ),
          child: const Icon(
            Icons.shopping_bag,
            color: Color(0xffcacace),
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            height: 400,
            width: 400,
            child: Column(
             //  mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: CircleAvatar(
                          radius: 60,
                          child: Image(image: AssetImage('assets/images/girl_profile.png'),)
                      ),
                    ),
                    SizedBox(height: 0,),
                    Text(FirebaseAuth.instance.currentUser!.email!,style: TextStyle(color: Colors.black,fontSize: 20),),
                  ],
                ),

              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // good morning bro
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good morning,'),
            ),

             SizedBox(height: screenHeight * 0.01),

            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                color: Colors.white70,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: screenHeight * 0.25,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.easeInOut,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          child: Image.asset(
                            image,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),),



             Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.1),
              child: Divider(),
            ),

            const SizedBox(height: 24),

            // categories -> horizontal listview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: GoogleFonts.notoSerif(
                  //fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            Consumer<CartModel>(
              builder: (context, value, child) {
                return SizedBox(
                  height: screenHeight * 0.5, // Set a specific height for the GridView
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(12),
                   // physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      final item = value.shopItems[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the detailed page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ItemDetailPage(
                                  itemName: item[0],
                                  itemPrice: item[1],
                                  imagePath: item[2],
                                  itemDescription:
                                      "This is a detailed description of ${item[0]}. Fresh, natural, and high quality, sourced directly from local farms to provide the best taste and nutrients for your meals.",
                                );
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 2,
                          child: GroceryItemTile(
                            itemName: item[0],
                            itemPrice: item[1],
                            imagePath: item[2],

                            onPressed: () {
                              // Optional: You can handle Add to Cart logic here if you want to add directly from the grid view
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

           // const SizedBox(height: 24),
          ],
        ));
  }
}
