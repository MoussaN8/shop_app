import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  void ajouterProduit(Map<String, dynamic> produit) {
    cart.add(produit);
    notifyListeners();
  }

  void supprimerProduit(Map<String, dynamic> produit) {
    cart.remove(produit);
    notifyListeners();
  }
}
