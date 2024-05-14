
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_project2024/packegs/Views/shared/package_card.dart';
import 'package:travel_project2024/packegs/Views/shared/staggered_til.dart';
import 'package:travel_project2024/packegs/Views/ui/packagePage.dart';
import 'package:travel_project2024/packegs/models/sneaker_model.dart';

class PopularPackeg extends StatelessWidget {
  const PopularPackeg({
    super.key,
    required Future<List<Sneakers>> threeday, required this.tabIndex,
  }) : _threeday = threeday;

  final Future<List<Sneakers>> _threeday;
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
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
            return StaggeredGridView.countBuilder(
                padding :EdgeInsets.zero,
                crossAxisCount : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing:16,
                itemCount:
                threeday!.length,
                scrollDirection:
                Axis.vertical,
                staggeredTileBuilder: (index) => StaggeredTile.extent(
                    (index % 2 == 0 )? 1:1, (index % 4 ==1 || index % 4 == 3)
                    ?MediaQuery.of(context).size.height*0.35
                    : MediaQuery.of(context).size.height*0.33),
                itemBuilder:
                    (context, index) {
                  final item = snapshot.data![index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PackagePage(id: item.id, category: item.category,price: item.price,name: item.date,)));
                    },
                    child:  StaggerTile
                      (id: item.id,
                      image: item.image[0],
                      date: item.date,
                      prices: item.price,
                      country:item.country,
                      SuitableFor:item.suitableFor,
                    )
                  );
                });
          }
        });
  }
}
