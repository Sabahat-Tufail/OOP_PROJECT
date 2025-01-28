import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/favorite_model.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, favoriteModel, child) {
          return favoriteModel.favoriteItems.isEmpty
              ? Center(child: Text("No favorites added yet."))
              : ListView.builder(
            itemCount: favoriteModel.favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteModel.favoriteItems[index];
              return ListTile(
                title: Text(item['name']),
                subtitle: Text(item['price']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove item from favorites
                    favoriteModel.removeItemFromFavorite(item['name']);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
