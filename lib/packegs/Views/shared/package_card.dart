
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';

class PackageCart extends StatefulWidget {
  const PackageCart(
      {super.key,
      required this.prices,
      required this.country,
      required this.id,
      required this.date,
      required this.image,
        required this.SuitableFor});

  final String prices;
  final String  country;
  final String id;
  final String date;
  final String image;
  final String SuitableFor;

  @override
  State<PackageCart> createState() => _PackageCartState();
}

class _PackageCartState extends State<PackageCart> {
  @override
  Widget build(BuildContext context) {
    bool selected =  true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0.6,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                        image:DecorationImage(
                            image:
                            AssetImage(widget.image)),),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(MaterialCommunityIcons.heart_outline,color: Colors.black54,),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                children: [
                    Text(
                      widget.date, style: appstyle1(25, Colors.black, FontWeight.bold, 1.5,),
                    ),
                    Text(' Package',
                    style: appstyle(25, Colors.black, FontWeight.w500),),],),
                    Text(
                      widget.country, style: appstyle1(18, Colors.blue, FontWeight.w500, 1.5,),),
                    Row(
                      children: [
                        Text('Price :  ',
                          style: appstyle(15, Colors.grey, FontWeight.w500),),
                        Text(widget.prices,
                          style: appstyle(20, Colors.black, FontWeight.w600,),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Suitable for :  ',
                          style: appstyle(15, Colors.grey, FontWeight.w500),),
                        Text(widget.SuitableFor ,
                          style: appstyle(15, Colors.blueAccent, FontWeight.w600,),),
                      ],
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
}
