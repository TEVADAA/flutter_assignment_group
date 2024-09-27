import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screen/home_page.dart';
import 'Screen/cart_page.dart'; // Import CartPage
import 'Screen/payment_page.dart'; // Import PaymentPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/cart': (context) => const CartPage(cartItems: []),
        '/payment': (context) =>
            const PaymentPage(totalAmount: 0), // Update as needed
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/payment') {
          final args = settings.arguments as double?;
          return MaterialPageRoute(
            builder: (context) => PaymentPage(totalAmount: args ?? 0),
          );
        }
        return null; // Return null if route not found
      },
    );
  }
}
