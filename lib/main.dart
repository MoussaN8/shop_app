import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/cart_provider.dart';
import 'package:shop_app/screen/home_page.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        home: const HomePage(),
      
        theme: ThemeData.light().copyWith(
          textTheme:
              GoogleFonts.robotoTextTheme(
                ThemeData.light(useMaterial3: true).textTheme,
              ).copyWith(
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(213, 15, 15, 1),
            primary: const Color.fromRGBO(213, 15, 15, 1),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
