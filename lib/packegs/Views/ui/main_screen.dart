
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_project2024/packegs/Controllers/mainscreen_provider.dart';
import 'package:travel_project2024/packegs/Views/shared/bottom_nav.dart';
import 'package:travel_project2024/packegs/Views/ui/homepage.dart';
import 'package:travel_project2024/packegs/Views/ui/send_message.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomePage(),
    chat(),

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNoTifier>(
      builder: (context, mainScreenNoTifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNoTifier.pageIndex],
          bottomNavigationBar:const BottoNavBar(),
        );
      },
    );
  }
}







