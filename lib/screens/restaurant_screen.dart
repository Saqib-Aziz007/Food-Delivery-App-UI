import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/stars_builder.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key, this.restaurant}) : super(key: key);

  final Restaurant? restaurant;

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant!.imageUrl,
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant!.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.white,
                      iconSize: 30.0,
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: const Icon(
                        Icons.favorite,
                        size: 35.0,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant!.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Text('0.2 miles away'),
                  ],
                ),
                const SizedBox(height: 6.0),
                StarsBuilder(rating: widget.restaurant!.rating),
                const SizedBox(height: 6.0),
                Text(
                  widget.restaurant!.address,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(
                widget.restaurant!.menu.length,
                (index) {
                  final food = widget.restaurant!.menu[index];
                  return _restaurantMenuItem(food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _restaurantMenuItem(Food menuItem) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage(
                menuItem.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                ],
                stops: const [
                  0.1,
                  0.4,
                  0.6,
                  0.9
                ]),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                menuItem.name,
                style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${menuItem.price}',
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
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
        ),
      ],
    );
  }
}
