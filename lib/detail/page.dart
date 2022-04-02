import 'package:flutter/material.dart';
import '../data/restaurant.dart';
import 'package:get/get.dart';
import 'detail.dart';

class Myhomepage extends StatelessWidget {
  static const routeName = '/restaurants_list';
  const Myhomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/restoran.json'),
            builder: (context, snapshot) {
              final List<Restaurant> restaurants =
                  parseRestaurant(snapshot.data);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildRestaurantsitem(context, restaurants[index]);
                  },
                );
              } else {
                return const Center(
                  child: Text('Error please relog'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildRestaurantsitem(BuildContext context, Restaurant restaurants) {
  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheigt = MediaQuery.of(context).size.height;
  return Card(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8.0),
      leading: Hero(
        tag: restaurants.pictureId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            restaurants.pictureId,
            width: mediawidth * 0.19,
            scale: 3.4,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        restaurants.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Column(children: [
        Row(
          children: [
            SizedBox(
              height: mediaheigt * 0.02,
              width: mediawidth * 0.003,
            ),
            const Icon(
              Icons.maps_home_work,
              size: 15,
            ),
            SizedBox(
              width: mediawidth * 0.02,
              height: mediaheigt * 0.04,
            ),
            Text(restaurants.city),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.1, top: 4),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                size: 18,
              ),
              Text(restaurants.rating.toString()),
            ],
          ),
        ),
      ]),
      onTap: () {
        Get.to(Detailhome(restaurants: restaurants));
      },
    ),
  );
}
