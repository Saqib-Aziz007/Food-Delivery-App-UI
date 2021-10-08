import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery_app/data/data.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 120,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (context, index) {
              final order = currentUser.orders[index];
              return Container(
                margin: const EdgeInsets.all(10),
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade100,
                  ),
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
                          Text(
                            order.date,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
