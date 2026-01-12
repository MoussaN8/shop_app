import 'package:flutter/material.dart';
import 'package:shop_app/screen/cart_provider.dart';
import 'package:provider/provider.dart';

class DetailProduit extends StatefulWidget {
  final Map<String, Object> produit;
  const DetailProduit({super.key, required this.produit});

  @override
  State<DetailProduit> createState() => _DetailProduitState();
}

class _DetailProduitState extends State<DetailProduit> {
  int? pointureSelectionner;

  void onTap() {
    if (pointureSelectionner != null) {
      Provider.of<CartProvider>(context, listen: false).ajouterProduit({
        'id': widget.produit['id'],
        'titre': widget.produit['titre'],
        'prix': widget.produit['prix'],
        'imageUrl': widget.produit['imageUrl'],
        'marque': widget.produit['marque'],
        'pointure': pointureSelectionner,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Produit ajouté au panier avec succés')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez Choisir un pointure !')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Column(
        children: [
          Text(
            widget.produit['titre'] as String,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),

          Image.asset(widget.produit['imageUrl'] as String),

          Expanded(
            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 236, 238),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${widget.produit['prix']} FCFA',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center, // centre horizontalement
                    spacing: 12, // espace horizontal entre chips
                    runSpacing: 12, // espace vertical si retour à la ligne
                    children: (widget.produit['pointure'] as List<int>).map((
                      pointure,
                    ) {
                      final estSelectionner = pointure == pointureSelectionner;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            pointureSelectionner = pointure;
                          });
                        },
                        child: Chip(
                          label: Text(pointure.toString()),
                          backgroundColor: estSelectionner
                              ? Colors.amber
                              : Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: Text(
                        'Ajouter au panier',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        onTap();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
