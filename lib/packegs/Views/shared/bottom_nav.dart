
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_project2024/packegs/Controllers/mainscreen_provider.dart';
import 'package:travel_project2024/packegs/Views/shared/botom_nav_widget.dart';

class BottoNavBar extends StatelessWidget {
  const BottoNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNoTifier>(
        builder: (context,mainScreenNoTifier,child){
           return SafeArea(
             child: Padding(
               padding: const EdgeInsets.all(2),
               child: Container(
                 padding: const EdgeInsets.all(12),
                 margin: const EdgeInsets.symmetric(horizontal: 10),
                 decoration: const BoxDecoration(
                   color: Colors.black,
                   borderRadius: BorderRadius.all(Radius.circular(16)),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 130),
                   child: Row(
                     children: [
                       BotomNavWidget(
                         onTop: () {
                           mainScreenNoTifier.pageIndex = 0;
                         },
                         icon: mainScreenNoTifier.pageIndex == 0
                             ? MaterialCommunityIcons.home
                             : MaterialCommunityIcons.home_outline,
                       ),
                       SizedBox(width: 20profile_ui.dart,),
                       BotomNavWidget(
                           onTop: () {
                             mainScreenNoTifier.pageIndex = 1;
                           },
                           icon: mainScreenNoTifier.pageIndex == 1 ?
                           Icons.feedback
                               : Icons.feedback_outlined
                       ),
                       SizedBox(width: 20profile_ui.dart,),
                       BotomNavWidget(
                           onTop: () {
                             mainScreenNoTifier.pageIndex = 2;
                           },
                           icon: mainScreenNoTifier.pageIndex == 2 ?
                           Icons.feedback
                               : Icons.feedback_outlined
                       ),

                     ],
                   ),
                 ),
               ),),);
        },
    );}
}