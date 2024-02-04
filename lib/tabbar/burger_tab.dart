import 'package:flutter/material.dart';

import '../pages/burger_detail_page.dart';
import '../widgets/burger_tile.dart';

class BurgerTab extends StatefulWidget {
  const BurgerTab({super.key});

  @override
  State<BurgerTab> createState() => _BurgerTabState();
}

class _BurgerTabState extends State<BurgerTab> {
  List burgersOnSale = [
    ["CheeseBurger", "110", Colors.blue, "lib/images/burger.png"],
    ["Mushroom", "115", Colors.red, "lib/images/burger2.png"],
    ["Barbeque", "112", Colors.purple, "lib/images/burger3.png"],
    ["XL Burger", "150", Colors.brown, "lib/images/burger4.png"],
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: burgersOnSale.length,
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
                builder: (context) => BurgerDetail(
                  burgerFlavor: burgersOnSale[index][0],
                  burgerPrice: burgersOnSale[index][1],
                  burgerColor: burgersOnSale[index][2],
                  imageName: burgersOnSale[index][3],
                ),
              ),
            );
          },
          child: BurgerTile(
            burgerFlavor: burgersOnSale[index][0],
            burgerPrice: burgersOnSale[index][1],
            burgerColor: burgersOnSale[index][2],
            imageName: burgersOnSale[index][3],
          ),
        );
      },
    );
  }
}
