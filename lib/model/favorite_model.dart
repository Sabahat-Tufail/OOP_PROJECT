import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  // List to hold favorite items
  List<Map<String, dynamic>> _favoriteItems = [];

  // Getter for favorite items
  List<Map<String, dynamic>> get favoriteItems => _favoriteItems;

  // Add item to favorites
  void addItemToFavorite(Map<String, dynamic> item) {
    if (!_favoriteItems.any((favItem) => favItem['name'] == item['name'])) {
      _favoriteItems.add(item);
      notifyListeners();
    }
  }

  // Remove item from favorites
  void removeItemFromFavorite(String itemName) {
    _favoriteItems.removeWhere((item) => item['name'] == itemName);
    notifyListeners();
  }

  // Toggle item in favorites (Add or Remove)
  void toggleFavorite(Map<String, dynamic> item) {
    if (isFavorite(item)) {
      removeItemFromFavorite(item['name']);
    } else {
      addItemToFavorite(item);
    }
  }

  // Check if an item is in favorites
  bool isFavorite(Map<String, dynamic> item) {
    return _favoriteItems.any((favItem) => favItem['name'] == item['name']);
  }
}
