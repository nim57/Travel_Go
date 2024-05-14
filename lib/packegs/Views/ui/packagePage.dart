
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_project2024/packegs/Controllers/product_provider.dart';
import 'package:travel_project2024/packegs/Views/shared/Check_out_Btn.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';
import 'package:travel_project2024/packegs/Views/ui/Create_new_account.dart';
import 'package:travel_project2024/packegs/Views/ui/Login_page.dart';
import 'package:travel_project2024/packegs/Views/ui/registration_succes.dart';
import 'package:travel_project2024/packegs/models/sneaker_model.dart';
import 'package:travel_project2024/packegs/services/helper.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key, required this.id, required this.category, required this.price, required this.name});

  final String id;
  final String category;
  final String price;
  final String name;

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {

  final _cartBox = Hive.box('cart_box');

  late Future<Sneakers> _sneaker;
  final PageController pageController = PageController();

  void getItems(){
    _sneaker = Helper().getPackageSneakersById(widget.id);
  }
  Future<void> _createCart(Map<String, dynamic> newCart) async{
    await _cartBox.add(newCart);
  }
  @override
  void initState() {
    super.initState();
    getItems();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder<Sneakers>(
          future: _sneaker,
          builder: (context, snapshot) {
            if (snapshot
                .connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else {
              final sneaker = snapshot.data!;
              return Consumer<ProductNotifier>(
                  builder: (context, productNotifier, child) {
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                            automaticallyImplyLeading: false,
                            leadingWidth: 100,

                            title: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(AntDesign.close),
                                  ),

                                  GestureDetector(
                                    onTap: null,
                                    child: const Icon(Ionicons.ellipsis_horizontal),
                                  ),
                                ],
                              ),
                            ),

                            pinned: true,
                            snap: false,
                            floating: true,
                            backgroundColor: Colors.transparent,
                            expandedHeight: MediaQuery.of(context).size.height,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Stack(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: PageView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: sneaker.image.length,
                                        controller: pageController,
                                        onPageChanged: (page) {
                                          productNotifier.activepage = page;
                                        },
                                        itemBuilder: (context, int index) {
                                          return Stack(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.4,
                                                width: MediaQuery.of(context).size.width*1,
                                                color: Colors.grey.shade300,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(0),
                                                  child: Image.asset(sneaker.image[index],fit: BoxFit.fill,),
                                                ),
                                              ),
                                              Positioned(
                                                top: MediaQuery.of(context).size.height * 0.1,
                                                right: 20,
                                                child: Icon(AntDesign.hearto,
                                                  color: Colors.black,),),
                                              Padding(
                                                padding: const EdgeInsets.only(top:255),
                                                child: Positioned(bottom: 0, right: 0, left: 0,
                                                  height: MediaQuery.of(context).size.height * 0.3,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: List<Widget>.generate(
                                                      sneaker.image.length, (index) =>
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 4),
                                                          child: CircleAvatar(radius: 5,
                                                            backgroundColor: productNotifier.activepage != index ? Colors.grey
                                                                : Colors.black,
                                                          ),
                                                        ),),

                                                  ),),
                                              ),
                                            ],
                                          );
                                        }
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 270.0),
                                    child: Positioned(
                                      bottom: 30,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * 0.645,
                                          width: MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    RatingBar.builder(
                                                        initialRating:4,
                                                        minRating:1,
                                                        direction:Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount:5,
                                                        itemSize:25,
                                                        itemPadding:EdgeInsets.symmetric(horizontal: 1),
                                                        itemBuilder:(context,_) =>
                                                            Icon(Icons.star,
                                                              size: 25,
                                                              color: Colors.black,),
                                                        onRatingUpdate:(rating){

                                                        }
                                                    ),
                                                    SizedBox(width: 70,),
                                                    Text('Suitable for : ',style: appstyle(15, Colors.grey, FontWeight.w600),),
                                                    Text(sneaker.suitableFor,style: appstyle(15, Colors.blueAccent, FontWeight.w600),)
                                                  ],
                                                ),
                                                SizedBox(height: 15,),

                                                Row(
                                                  children: [
                                                    Text(
                                                      sneaker.date,
                                                      style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(' Tour Package ',style: appstyle(30, Colors.black54, FontWeight.w600),),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text('Price : ',style: appstyle(25, Colors.black54, FontWeight.w600),),
                                                    Text(sneaker.price,style: appstyle(25, Colors.black, FontWeight.bold),),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text('Tour Summary',style: appstyle(23, Colors.black, FontWeight.w600),),
                                                    SizedBox(width: 20,),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Text(
                                                  sneaker.about,
                                                  style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text('Inclusion',style: appstyle(20, Colors.black, FontWeight.w600),),
                                                Text(sneaker.inclusion,style: appstyle(15, Colors.black54, FontWeight.w700), ),
                                                SizedBox(height: 10,),
                                                 Row(
                                                   children: [
                                                     Text("Number Of Cities :",style: appstyle(20, Colors.grey, FontWeight.w700),),
                                                     Text(sneaker.numberOfCities,style: appstyle(20, Colors.black, FontWeight.w700),),
                                                   ],
                                                 ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text("Package Theam:",style: appstyle(20, Colors.grey, FontWeight.w700),),
                                                    Text(sneaker.tourTheme,style: appstyle(20, Colors.black, FontWeight.w700),),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Text("If yo want to more details visit our WebSite <<Click>>",style: appstyle(15, Colors.grey, FontWeight.w500),),

                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Padding(padding: EdgeInsets.only(top: 12),
                                                  child: CheckoutButton(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => CreateNew(id: sneaker.id,price: sneaker.price, name: sneaker.date,)),
                                                      );
                                                    },
                                                    label: "Get order",
                                                  ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ],
                    );
                  }
              );
            }
          }),);
  }
}

