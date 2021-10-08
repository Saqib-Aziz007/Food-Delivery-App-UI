import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/nearby_restaurant.dart';
import 'package:food_delivery_app/components/recent_orders.dart';
import 'package:food_delivery_app/data/data.dart';

import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery App'),
        leading: const Icon(Icons.account_circle),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            ),
            child: Text(
              'Cart(${currentUser.orders.length})',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          //SearchBar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search Food and Restaurant',
                suffixIcon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const RecentOrders(),
          const NearbyRestaurant(),
        ],
      ),
    ));
  }
}
