// Bu dosya, içerdiği DrinksDetail widget'ıyla içecek detayları sayfasını tanımlar.
// Widget'lar, Flutter uygulamasında kullanıcı arayüzünü oluşturan temel yapı taşlarıdır.

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// DrinksDetail sınıfı, içecek detaylarını içeren bir StatefulWidget'dir.
class DrinksDetail extends StatefulWidget {
  final String drinksFlavor;
  final String drinksPrice;
  final Color drinksColor;
  final String imageName;
  const DrinksDetail({
    Key? key,
    required this.drinksFlavor,
    required this.drinksPrice,
    required this.drinksColor,
    required this.imageName,
  }) : super(key: key);

  // DrinksDetail sınıfına ait durum (state) sınıfını oluşturan metodun implementasyonu.
  @override
  State<DrinksDetail> createState() => _DrinksDetailState();
}

// _DrinksDetailState sınıfı, DrinksDetail widget'ının durumunu yönetir.
class _DrinksDetailState extends State<DrinksDetail> {
  // Ürün sayısını takip etmek için bir sayaç.
  int count = 0;

  // Sayaç artırma işlemi.
  void increment() {
    count++;
  }

  // Sayaç azaltma işlemi.
  void deincrement() {
    count--;
  }

  // Widget'ın ekran üzerinde oluşturulmasını sağlayan metod.
  @override
  Widget build(BuildContext context) {
    // Ekran boyutunu almak için MediaQuery kullanılıyor.
    final size = MediaQuery.of(context).size;

    // Scaffold widget'ı, temel materyal tasarımı sağlar.
    return Scaffold(
      // AppBar, sayfanın üst kısmında bir başlık çubuğu oluşturur.
      appBar: AppBar(
        title: const Text('Basket Page'), // Sayfa başlığı.
      ),
      // Center widget'ı, içerdiği widget'ı ekranda ortalar.
      body: Center(
        child: Column(
          children: [
            // Ürün detaylarını gösteren bir konteyner.
            Container(
              height: size.height * 0.5,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                // İçeceğin rengini ve opaklığını belirleyen bir kutu süsleme.
                color: widget.drinksColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(25), // Kenar yuvarlama.
              ),
              // Stack, üzerindeki widget'ları üst üste binmiş gibi gösterir.
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        // İçecek resmini gösteren bir görüntü widget'ı.
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
            // İçecek ismi, kalın ve büyük font ile gösterilir.
            Text(
              widget.drinksFlavor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // İçeceğin fiyatı ve rengiyle gösterilir.
            Text(
              '\$${widget.drinksPrice}',
              style: TextStyle(
                fontSize: 20,
                color: widget.drinksColor,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // Sipariş sayısını gösteren bir satır.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sipariş sayısını azaltan buton.
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (count == 0) {
                        return;
                      }
                      deincrement();
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                SizedBox(width: size.width * 0.05),
                // Sipariş sayısını gösteren metin.
                Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(width: size.width * 0.05),
                // Sipariş sayısını artıran buton.
                IconButton(
                  onPressed: () {
                    setState(() {
                      increment();
                    });
                  },
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
                  // Sipariş sayısı 1'den küçükse işlemi gerçekleştirme.
                  if (count < 1) {
                    return;
                  }
                  _dialogBuilder(
                      context); // İkinci bir onay için dialog gösterimi.
                },
                child: const Text(
                  'Sepete Ekle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog gösterimi için metod.
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: Text(
            '$count products added!',
            style: const TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            // İptal butonu.
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat.
              },
            ),
            // Onay butonu.
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'),
              onPressed: () {
                // '/home' sayfasına geri dönüş yapılır ve diğer sayfalar kapatılır.
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
