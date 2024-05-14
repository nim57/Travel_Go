
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';
import 'package:travel_project2024/packegs/Views/shared/package_card.dart';
import 'package:travel_project2024/packegs/Views/ui/package_by_cart.dart';
import 'package:travel_project2024/packegs/Views/ui/packagePage.dart';
import 'package:travel_project2024/packegs/models/sneaker_model.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> threeday, required this.tabIndex,
  }) : _threeday = threeday;

  final Future<List<Sneakers>> _threeday;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PackageByCat(
                            tabIndex: tabIndex,
                          )));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Our Package",style: appstyle(23, Colors.black, FontWeight.w700),),
                            SizedBox(width: 85,),
                            Text(
                              'Show All',
                              style: appstyle(
                                  18,
                                  Colors.blueAccent,
                                  FontWeight.w500),
                            ),
                            Icon(
                              AntDesign.caretright,
                              size: 18,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.405,
                child:
                FutureBuilder<
                    List<Sneakers>>(
                    future: _threeday,
                    builder: (context, snapshot) {
                      if (snapshot
                          .connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot
                          .hasError) {
                        return Text(
                            'Error ${snapshot.error}');
                      } else {
                        final threeday = snapshot.data;
                        return ListView.builder(
                            itemCount:3,
                            scrollDirection:
                            Axis.horizontal,
                            itemBuilder:
                                (context, index) {
                              final item = snapshot.data![index];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PackagePage(id: item.id, category: item.category,price: item.price, name: item.date,)));
                                },
                                child: PackageCart(
                                    prices: item.price,
                                    date: item.date,
                                    id: item.id,
                                    country: item.country,
                                    image: item.image[1],
                                    SuitableFor : item.suitableFor
                                ),
                              );
                            });
                      }
                    })),
          ],
        ),



      ],
    );
  }
}