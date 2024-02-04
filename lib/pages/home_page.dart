import 'package:donattapp/tabbar/smoothie_tab.dart'; // Smoothie tab'ının içeriğini gösteren dosya dahil edilmiştir.
import 'package:flutter/material.dart'; // Flutter framework'ünün temel materyal widget'larını içeren kütüphane dahil edilmiştir.

import '../tabbar/burger_tab.dart'; // Burger tab'ının içeriğini gösteren dosya dahil edilmiştir.
import '../tabbar/donut_tab.dart'; // Donut tab'ının içeriğini gösteren dosya dahil edilmiştir.
import '../tabbar/my_tab.dart'; // Özel sekme (tab) widget'ını içeren dosya dahil edilmiştir.

class HomePage extends StatefulWidget {
  // HomePage adında bir StatefulWidget sınıfı tanımlanmıştır.
  const HomePage(
      {super.key}); // HomePage sınıfının constructor'ı tanımlanmıştır.

  @override
  State<HomePage> createState() =>
      _HomePageState(); // HomePage sınıfına ait durum (state) sınıfını oluşturan metodun implementasyonu.
}

class _HomePageState extends State<HomePage> {
  // HomePage sınıfına ait durum (state) sınıfı tanımlanmıştır.
  // myTabs adında bir liste tanımlanmıştır.
  List<Widget> myTabs = const [
    // Donut tab'ını temsil eden MyTab widget'ı oluşturulmuştur.
    MyTab(
      iconPath: 'lib/icons/donut.png',
    ),

    // Burger tab'ını temsil eden MyTab widget'ı oluşturulmuştur.
    MyTab(
      iconPath: 'lib/icons/burger.png',
    ),

    // Smoothie tab'ını temsil eden MyTab widget'ı oluşturulmuştur.
    MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Widget'ın arayüzünü oluşturan build metodu.
    final size = MediaQuery.of(context)
        .size; // Ekran boyutunu almak için MediaQuery kullanılmıştır.
    return DefaultTabController(
      length: myTabs
          .length, // Varsayılan sekme denetleyicisinin uzunluğu, myTabs listesinin uzunluğu olarak belirlenmiştir.
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors
              .transparent, // App bar'ın arkaplan rengi şeffaf olarak belirlenmiştir.
          elevation:
              0, // App bar'ın gölge efekti olmadan görüntülenmesi sağlanmıştır.
          leading: Padding(
            padding: EdgeInsets.only(left: size.width * 0.01),
            child: IconButton(
              icon: Icon(Icons.person,
                  color: Colors.grey[600],
                  size: 36), // Sol üstteki kişi simgesi eklenmiştir.
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/profile',
                    (route) =>
                        true); // Kişi simgesine tıklandığında '/profile' sayfasına geçiş yapılır.
              },
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/contact',
                      (route) =>
                          true); // Sağ üstteki kişi simgesine tıklandığında '/contact' sayfasına geçiş yapılır.
                },
                child: Icon(Icons.quick_contacts_dialer,
                    color: Colors.grey[600],
                    size: 36), // Sağ üstteki kişi simgesi eklenmiştir.
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Row(
                children: [
                  Text(
                    'I Want To Eat ?', // Sayfanın başlığı olan "I Want To Eat ?" metni eklenmiştir.
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors
                            .black), // Metnin stil özellikleri belirlenmiştir.
                  ),
                ],
              ),
            ),

            // Tab bar
            TabBar(
                tabs:
                    myTabs), // TabBar widget'ı, myTabs listesini kullanarak sekme (tab) kontrolünü oluşturur.

            // Tab bar view
            const Expanded(
              child: TabBarView(
                children: [
                  // Donut sayfası
                  DonutTab(),

                  // Burger sayfası
                  BurgerTab(),

                  // Smoothie sayfası
                  DrinksTab(),

                  // Pancake sayfası
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
