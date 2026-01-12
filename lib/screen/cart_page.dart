import 'package:flutter/material.dart';
import 'package:shop_app/screen/cart_provider.dart';
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: Text('Boutique')),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartElement = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage((cartElement['imageUrl']).toString()),
            ),
            title: Text(
              cartElement['titre'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('pointure ${cartElement['pointure']}'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Voulez-vous vraiment supprimer ce produit ?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).supprimerProduit(cartElement);
                            Navigator.of(context).pop();
                          },
                          child: Text('Oui'),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).supprimerProduit(cartElement);
                            Navigator.of(context).pop();
                          },
                          child: Text('Non'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
