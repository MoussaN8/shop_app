import 'package:flutter/material.dart';

class ProduitCart extends StatelessWidget {
  final String titre;
  final int prix;
  final String imageUrl;
  const ProduitCart({
    super.key,
    required this.titre,
    required this.prix,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(255, 223, 230, 233),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titre, style: Theme.of(context).textTheme.titleMedium),
          Text('$prix FCFA',style: TextStyle(color: Colors.grey),),
          Center(child: Image.asset(imageUrl, height: 160)),
        ],
      ),
    );
  }
}
