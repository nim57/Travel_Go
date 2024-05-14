import 'package:flutter/services.dart' as the_bundel;
import 'package:travel_project2024/packegs/models/sneaker_model.dart';



class Helper{

    //3day
    Future<List<Sneakers>> getPackageSneakers() async{
        final data = await the_bundel.rootBundle.loadString("images/json/Packages.json");

        final packagList = sneakersFromJson(data);

        return packagList;

    }

    //Single 3day
    Future<Sneakers> getPackageSneakersById(String id) async{
        final data = await the_bundel.rootBundle.loadString("images/json/Packages.json");

        final packagList = sneakersFromJson(data);

        final sneaker = packagList.firstWhere((sneaker) => sneaker.id == id);

        return sneaker;

    }

}