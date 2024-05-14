
import 'package:flutter/material.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({super.key, required this.image, required this.date,required this.prices, required this.country, required this.SuitableFor, required this.id});
  final String id;
  final String image;
  final String date;
  final String prices;
  final String country;
  final String SuitableFor;


  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16),),
      ),
      child:
      Padding(padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.image),
          Container(
            padding:const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.date, style: appstyle1(19, Colors.black, FontWeight.bold, 1.5,),
                    ),
                    Text(' Package',
                      style: appstyle(19, Colors.black, FontWeight.w500),),],),
                Text(
                  widget.country, style: appstyle1(18, Colors.blue, FontWeight.w500, 1.5,),),
                Row(
                  children: [
                    Text('Price :  ',
                      style: appstyle(15, Colors.grey, FontWeight.w500),),
                    Text(widget.prices,
                      style: appstyle(15, Colors.black, FontWeight.w600,),),
                  ],
                ),
                Row(
                  children: [
                    Text('Suitable for:  ',
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
    );
  }
}
