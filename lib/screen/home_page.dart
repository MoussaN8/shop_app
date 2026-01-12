import 'package:flutter/material.dart';
import 'package:shop_app/screen/cart_page.dart';
import 'package:shop_app/screen/listes_produit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [ListesProduit(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        iconSize: 40,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
        ],
      ),
    );
  }
}
