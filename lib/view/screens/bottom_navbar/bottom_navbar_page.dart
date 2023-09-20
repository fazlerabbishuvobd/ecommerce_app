import 'package:ecommerce_app/view/screens/add_to_cart_page/add_to_cart_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/checkout_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/payment_page.dart';
import 'package:ecommerce_app/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  List screens = [
    const HomePage(),
    const CheckoutPage(),
    const AddToCartPage(),
    const PaymentPage(),
  ];
  List<BottomNavigationBarItem> navBarItem = [
    const BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home)
    ),
    const BottomNavigationBarItem(
        label: 'Favourite',
        icon: Icon(Icons.favorite)
    ),
    const BottomNavigationBarItem(
        label: 'Add to cart',
        icon: Icon(Icons.shopping_cart)
    ),
    const BottomNavigationBarItem(
        label: 'Message',
        icon: Icon(Icons.message)
    ),
  ];

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.deepOrange.withOpacity(0.3),
        items: navBarItem,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}