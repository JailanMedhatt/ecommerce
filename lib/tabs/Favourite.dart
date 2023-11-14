import 'package:flutter/material.dart';

class FavouriteTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Column(children: [
        IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage(
              "assets/images/person.png",
            ),size: 40,))
      ],),
    );
  }
}
