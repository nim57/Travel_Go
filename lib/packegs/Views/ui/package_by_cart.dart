
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';
import 'package:travel_project2024/packegs/Views/shared/category_btn.dart';
import 'package:travel_project2024/packegs/Views/shared/customer_spacer.dart';
import 'package:travel_project2024/packegs/Views/shared/popularPackeg.dart';
import 'package:travel_project2024/packegs/models/sneaker_model.dart';
import 'package:travel_project2024/packegs/services/helper.dart';

class PackageByCat extends StatefulWidget {
  const PackageByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<PackageByCat> createState() => _PackageByCatState();
}

class _PackageByCatState extends State<PackageByCat> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 1, vsync: this);

  late Future<List<Sneakers>> _package;

  void getpackage() {
    _package = Helper().getPackageSneakers();
  }

  @override
  void initState() {
    super.initState();
    getpackage();
  }

  double _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height*1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/image/success_celebration_800x600 - Copy.gif"),
                    fit: BoxFit.fill),),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Icon(AntDesign.close,color: Colors.black,),
                        ),

                        GestureDetector(
                          onTap:(){
                            filter();
                          },
                          child: Icon(FontAwesome.sliders,color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle:
                    appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.black54.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: 'Package',
                      ),
                    ],),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.23,
                left: 16,right: 12,),
              child: ClipRect(
                child: TabBarView(controller: _tabController ,
                    children:[
                      PopularPackeg(threeday: _package,
                        tabIndex:0,),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic>filter(){
    double _value = 0;
    return showModalBottomSheet(context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height:MediaQuery.of(context).size.height*0.82,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),
              topLeft: Radius.circular(25)
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ) ,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const CustomerSpacer(),
                  Text("Package Finder ",style: appstyle(40, Colors.black, FontWeight.bold),),
                  const CustomerSpacer(),
                  Text("Suitable for",style: appstyle(20, Colors.black, FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      CategoryBtn(buttonClr: Colors.black, label:"Famaly"),
                      CategoryBtn(buttonClr: Colors.black, label:"Single"),
                      CategoryBtn(buttonClr: Colors.black, label:"couple"),
                    ],
                  ),
                  CustomerSpacer(),
                  Text("Price", style: appstyle(20, Colors.black, FontWeight.w600),),

                  CustomerSpacer(),
                  Slider(
                    value: _selectedValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _selectedValue.toInt().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  // Display the selected value
                  Text(
                    "Selected value: ${_selectedValue.toInt()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  CustomerSpacer(),
                  Text("Number of daye", style: appstyle(20, Colors.black, FontWeight.w600),),

                  Slider(
                    value: _selectedValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _selectedValue.toInt().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  // Display the selected value
                  Text(
                    "Selected value: ${_selectedValue.toInt()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),);
  }
}

