import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  _isfavvalue(bool val) {
    isFavorite = val;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final oldstatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        "https://flutterproject-2b420-default-rtdb.firebaseio.com/products/$id.json");
    try {
      final repsonse =
          await http.patch(url, body: json.encode({'isfavourite': isFavorite}));
      if (repsonse.statusCode >= 400) {
        _isfavvalue(oldstatus);
      }
    } catch (error) {
      _isfavvalue(oldstatus);
    }
  }
}
