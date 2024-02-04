import 'package:flutter/material.dart';

import '../pages/smoothie_detail_page.dart';
import '../widgets/smoothie_tile.dart';

class DrinksTab extends StatefulWidget {
  const DrinksTab({super.key});

  @override
  State<DrinksTab> createState() => _DrinksTabState();
}

class _DrinksTabState extends State<DrinksTab> {
  List drinksOnSale = [
    ["Wine Kokteyl", "80", Colors.blue, "lib/images/drink.png"],
    ["Kokteyl", "90", Colors.red, "lib/images/drink2.png"],
    ["Deluxe Drinks", "65", Colors.purple, "lib/images/drink3.png"],
    ["Coca Cola", "30", Colors.brown, "lib/images/drink4.png"],
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: drinksOnSale.length,
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
                builder: (context) => DrinksDetail(
                  drinksFlavor: drinksOnSale[index][0],
                  drinksPrice: drinksOnSale[index][1],
                  drinksColor: drinksOnSale[index][2],
                  imageName: drinksOnSale[index][3],
                ),
              ),
            );
          },
          child: DrinksTile(
            drinksFlavor: drinksOnSale[index][0],
            drinksPrice: drinksOnSale[index][1],
            drinksColor: drinksOnSale[index][2],
            imageName: drinksOnSale[index][3],
          ),
        );
      },
    );
  }
}
