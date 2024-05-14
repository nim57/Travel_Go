import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_project2024/packegs/Views/shared/Check_out_Btn.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';
import 'package:travel_project2024/packegs/Views/ui/Login_page.dart';
import 'package:travel_project2024/packegs/Views/ui/main_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image/Artboard 1.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Text("CHASE YOUR DREAM,",style: TextStyle(fontFamily:"Gilroy",fontSize: 30),),
            Text("Travel",style: TextStyle(fontFamily:"Milkshake",fontSize: 70),),
            Text("The World",style: TextStyle(fontFamily:"Milkshake",fontSize: 70),),
            Padding(
              padding: const EdgeInsets.only(top: 320),
              child:Column (
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(top: 12),
                      child: CheckoutButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                          );
                        },
                        label: "Customer",
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(top: 12),
                      child: CheckoutButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        label: "Staff",
                      ),
                    ),
                  ),
                ],
              )

            ),
          ],
        ),
      ),
    );
  }
}
