import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/components/stars_builder.dart';
import 'package:food_delivery_app/screens/restaurant_screen.dart';

///
/// Change Notifiers
/// listanables.
/// ValueNotifier.
///
/// vs
///
/// Bloc, Streams.
///


class NearbyRestaurant extends StatelessWidget {
  const NearbyRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Nearby Restaurant',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildRestaurants(context),
      ],
    );
  }

  Widget _buildRestaurants(BuildContext context) {
    List<Widget> restaurantsList = [];
    for (var restaurant in restaurants) {
      restaurantsList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(
                restaurant: restaurant,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Row(
              children: [
                Hero(
                  tag: restaurant.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        restaurant.imageUrl,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      StarsBuilder(
                        rating: restaurant.rating,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.address,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      const Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      children: restaurantsList,
    );
  }
}
