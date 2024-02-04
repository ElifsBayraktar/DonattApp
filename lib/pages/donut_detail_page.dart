// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DonutDetail extends StatefulWidget {
  final String donutFlavor;
  final String donutPrice;
  final Color donutColor;
  final String imageName;

  // DonutDetail sınıfının constructor'ı, gerekli parametreleri alır.
  const DonutDetail({
    Key? key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
  }) : super(key: key);

  @override
  State<DonutDetail> createState() =>
      _DonutDetailState(); // State sınıfını oluşturan metodun implementasyonu.
}

class _DonutDetailState extends State<DonutDetail> {
  int count = 0;

  // Ürün sayısını artıran metod.
  void increment() {
    setState(() {
      count++;
    });
  }

  // Ürün sayısını azaltan metod.
  void deincrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Ekran boyutunu almak için MediaQuery kullanılmıştır.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket Page'), // Sayfa başlığı.
      ),
      body: Center(
        child: Column(
          children: [
            // Donut resmi ve dekorasyon içeren konteyner.
            Container(
              height: size.height * 0.5,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: widget.donutColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(25)),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          widget.imageName,
                          width: size.width * 0.7,
                          height: size.height * 0.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              widget.donutFlavor, // Donut lezzeti.
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '\$${widget.donutPrice}', // Donut fiyatı.
              style: TextStyle(fontSize: 20, color: widget.donutColor),
            ),
            SizedBox(height: size.height * 0.02),
            // Ürün sayısını seçmek için kullanılan artırma ve azaltma butonları.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: deincrement,
                  icon: const Icon(Icons.remove),
                ),
                SizedBox(width: size.width * 0.05),
                Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(width: size.width * 0.05),
                IconButton(
                  onPressed: increment,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            // Sepete ekle butonu.
            SizedBox(
              height: size.height * 0.075,
              width: size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (count > 0) {
                    _dialogBuilder(
                        context); // Ürün sayısı 1'den büyükse, dialog penceresini göster.
                  }
                },
                child: const Text(
                  'Sepete Ekle', // Sepete ekle butonu metni.
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // İkinci bir dialog penceresi gösteren metod.
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure?', // Kullanıcıya soru soran başlık metni.
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: Text(
            '$count products added!', // Eklenen ürün sayısı bilgisini içeren içerik metni.
            style: const TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'), // İptal butonu metni.
              onPressed: () {
                Navigator.of(context).pop(); // Dialog penceresini kapat.
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'), // Ekle butonu metni.
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) =>
                        false); // '/home' sayfasına geri dön ve diğer sayfaları kapat.
              },
            ),
          ],
        );
      },
    );
  }
}
