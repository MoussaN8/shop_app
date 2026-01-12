import 'package:flutter/material.dart';
import 'package:shop_app/screen/produit_cart.dart';
import 'package:shop_app/screen/produit_detail.dart';
import 'package:shop_app/variables.dart';

class ListesProduit extends StatefulWidget {
  const ListesProduit({super.key});

  @override
  State<ListesProduit> createState() => _ListesProduitState();
}

class _ListesProduitState extends State<ListesProduit> {
  final List<String> marques = [
    'Tout',
    'Adidas',
    'Nike',
    'Puma',
    'New balance',
  ];
  late String selectedMarque;
  @override
  void initState() {
    super.initState();
    selectedMarque = marques[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 100),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 0,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Rechercher',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: marques.length,
              itemBuilder: (context, index) {
                final marque = marques[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        selectedMarque = marque;
                      }),
                    },
                    child: Chip(
                      backgroundColor: selectedMarque == marque
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromRGBO(255, 255, 255, 1),
                      label: Text(marque),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: selectedMarque == marque
                            ? Colors.white
                            : Colors.grey,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: produits.length,
              itemBuilder: (context, index) {
                final produit = produits[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailProduit(produit: produit);
                        },
                      ),
                    );
                  },
                  child: ProduitCart(
                    titre: produit['titre'] as String,
                    prix: produit['prix'] as int,
                    imageUrl: produit['imageUrl'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
