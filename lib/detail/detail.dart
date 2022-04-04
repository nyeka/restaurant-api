import 'package:flutter/material.dart';
import '../widget/favorite.dart';
import 'package:get/get.dart';
import '../data/restaurant.dart';

class Detailhome extends StatelessWidget {
  static const routeName = './restaurants_detail';
  final Restaurant restaurants;
  // ignore: use_key_in_widget_constructors
  const Detailhome({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    final mediaheight = MediaQuery.of(context).size.height;
    final mediawidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Hero(
                    tag: restaurants.pictureId,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            restaurants.pictureId,
                            fit: BoxFit.cover,
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  const FavoriteButton(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurants.name,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: mediaheight * 0.025,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.maps_home_work,
                              size: 15,
                            ),
                            SizedBox(
                              width: mediawidth * 0.025,
                            ),
                            Text(restaurants.city),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 17,
                            ),
                            SizedBox(
                              height: mediaheight * 0.025,
                              width: mediawidth * 0.025,
                            ),
                            Text(restaurants.rating.toString()),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 15),
                          child: Text(
                            restaurants.description,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: mediaheight * 0.06,
                            ),
                            const Text(
                              'Foods : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: restaurants.menus.foods
                                    .map(
                                      (data) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 5),
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(data.name),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: mediawidth * 0.06,
                            ),
                            const Text(
                              'Drinks : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: restaurants.menus.drinks
                                    .map(
                                      (index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 25, horizontal: 5),
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(index.name),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
