import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:travel_project2024/packegs/Views/shared/Check_out_Btn.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';
import 'package:travel_project2024/packegs/Views/ui/homepage.dart';

class registration_succes extends StatefulWidget {
  const registration_succes({super.key});

  @override
  State<registration_succes> createState() => _registration_succesState();
}

class _registration_succesState extends State<registration_succes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
        height: MediaQuery.of(context).size.height,
    child: Stack(
    children: [
    Container(
    height: MediaQuery.of(context).size.height*1.5,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/image/success_celebration_800x600 - Copy.gif"),
    fit: BoxFit.fill),),
    child:
        Padding(
          padding: const EdgeInsets.only(top:80.0),
          child: Container(
            child: Column(
              children: [
                Text('Congratulations !',style: appstyle(40, Colors.black, FontWeight.bold),),
                SizedBox(height: 15,),
                Center(
              child: SizedBox(
                height: 300,
                 width: 450,
                 child: Image.asset("images/image/success_celebration_800x600.gif",fit: BoxFit.fill,),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Your  Package is \n      Successful !',style: appstyle(30, Colors.black, FontWeight.bold),),
                ),

                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(padding: EdgeInsets.all(20),
                    child: CheckoutButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      label: "Back Home",
                    ),
                  ),
                ),

              ], ),
          ),
        ),
  ),
    ],),
    ),);
  }
}
