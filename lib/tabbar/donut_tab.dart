import 'package:flutter/material.dart';

import '../pages/donut_detail_page.dart';
import '../widgets/donut_tile.dart';

class DonutTab extends StatefulWidget {
  const DonutTab({super.key});

  @override
  State<DonutTab> createState() => _DonutTabState();
}

class _DonutTabState extends State<DonutTab> {
  List donutsOnSale = [
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.03),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: size.height * 0.0008,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DonutDetail(
                  donutFlavor: donutsOnSale[index][0],
                  donutPrice: donutsOnSale[index][1],
                  donutColor: donutsOnSale[index][2],
                  imageName: donutsOnSale[index][3],
                ),
              ),
            );
          },
          child: DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          ),
        );
      },
    );
  }
}
