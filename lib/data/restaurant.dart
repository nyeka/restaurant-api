import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late Menus menus;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.rating,
      required this.city,
      required this.menus});

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    rating = restaurant['rating'].toString();
    city = restaurant['city'];
    menus = Menus.fromJson(restaurant['menus']);
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

class Menus {
  late List<Food> foods;
  late List<Food> drinks;

  Menus({
    required this.drinks,
    required this.foods,
  });

  factory Menus.fromJson(Map<String, dynamic> menu) {
    var listme = menu['drinks'] as List;
    List<Food> menulist = listme.map((e) => Food.fromJson(e)).toList();

    var listfood = menu['foods'] as List;
    List<Food> menufood = listfood.map((e) => Food.fromJson(e)).toList();
    return Menus(drinks: menulist, foods: menufood);
  }
}

class Food {
  late String name;
  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> parsedJson) {
    return Food(
      name: parsedJson['name'],
    );
  }
}


