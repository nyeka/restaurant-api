import 'package:flutter/material.dart';
import 'package:restaurantapi/data/apiservice.dart';
import 'package:restaurantapi/data/restaurant.dart';
import '../data/apiservice.dart';

class Alldata extends StatefulWidget {
  static const routeName = './listdata';

  const Alldata({Key? key}) : super(key: key);

  @override
  State<Alldata> createState() => _AlldataState();
}

class _AlldataState extends State<Alldata> {
  late Future<Restaurant> _data;

  @override
  void initState() {
    super.initState();
    _data = const ApiService().getdata();
  }

  Widget _buildlist(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (context, AsyncSnapshot<Restaurant> snapshot) {
        final List<Restaurant> restaurants =
            parseRestaurant(snapshot.data.toString());
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantsitem(context, restaurants[index]);
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildlist(context);
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
      // onTap: () {
      //   Get.to(Detailhome(restaurants: restaurants));
      // },
    ),
  );
}
