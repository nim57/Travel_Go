import 'package:flutter/material.dart';

class BotomNavWidget extends StatelessWidget {
  const BotomNavWidget({super.key, this.onTop, this.icon});
  final void Function()? onTop;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child:  SizedBox(
        height:36,
        width: 36,
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}