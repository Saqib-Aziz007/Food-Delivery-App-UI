import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.orders.length})'),
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (context, int index) {
          if (index < currentUser.cart.length) {
            final order = currentUser.cart[index];
            return _buildOrderItem(context, order);
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Estimated Delivery Time:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total cost:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${_totalPrice()}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, int index) {
          return const Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100,
        //color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            )
          ],
        ),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'CHECKOUT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              image: AssetImage(order.food.imageUrl),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.food.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  order.restaurant.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.black38,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '-',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        order.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${order.quantity * order.food.price}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _totalPrice() {
    double total = 0;
    for (var element in currentUser.cart) {
      total += element.quantity * element.food.price;
    }
    return total.toStringAsFixed(2);
  }
}
