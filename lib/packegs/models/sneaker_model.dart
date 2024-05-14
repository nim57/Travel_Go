
import 'dart:convert';

List<Sneakers> sneakersFromJson(String str) => List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

class Sneakers {
  final String id;
  final String date;
  final String category;
  final String price;
  final List<dynamic> image;
  final String country;
  final String numberOfCities;
  final String tourTheme;
  final String suitableFor;
  final String inclusion;
  final String about;
  final String day01Activities;

  Sneakers({
    required this.id,
    required this.date,
    required this.category,
    required this.price,
    required this.image,
    required this.country,
    required this.numberOfCities,
    required this.tourTheme,
    required this.suitableFor,
    required this.inclusion,
    required this.about,
    required this.day01Activities,
  });
  
  factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
    id: json["id"],
    date: json["Date"],
    category: json["category"],
    price: json["Price"],
    image: List<dynamic>.from(json["image"].map((x) => x)),
    country: json["Country"],
    numberOfCities: json["Number of Cities"],
    tourTheme: json["Tour Theme"],
    suitableFor: json["Suitable for"],
    inclusion: json["Inclusion"],
    about: json["About"],
    day01Activities: json["Day 01 Activities"],
  );
}
