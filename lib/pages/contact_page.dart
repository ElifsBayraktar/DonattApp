import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}); // ContactPage sınıfının constructor'ı.

  @override
  State<ContactPage> createState() =>
      _ContactPageState(); // ContactPage sınıfına ait durum (state) sınıfını oluşturan metodun implementasyonu.
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Ekran boyutunu almak için MediaQuery kullanılmıştır.

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us', // Sayfa başlığı.
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/images/communicate.png", // İletişim görseli.
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.05),

            // TELEFON NUMARASINA YÖNLENDİREN KOD BLOĞU
            Container(
              height: size.height * 0.075,
              width: size.width * 0.8,
              margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  Uri uri = Uri.parse(
                      'tel:+905529424276'); // Telefon numarasını içeren URI oluşturulmuştur.
                  if (!await launcher.launchUrl(uri)) {
                    debugPrint(
                        "Could not launch the uri"); // URI başlatılamazsa hata mesajı yazdırılır.
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone, // Telefon simgesi.
                      color: Colors.white,
                    ),
                    SizedBox(width: size.width * 0.05),
                    const Text(
                      'Launch Phone Number', // Telefon numarasını başlatan buton metni.
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            const Text('Or',
                style: TextStyle(color: Colors.black)), // "Or" metni.

            // WEB SİTESİNE YÖNLENDİREN KOD BLOĞU
            Container(
              height: size.height * 0.075,
              width: size.width * 0.8,
              margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  launcher.launchUrl(
                    Uri.parse(
                        'https://github.com/ElifsBayraktar'), // Github URI'si.
                    mode: launcher.LaunchMode.externalApplication,
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.web, // Web simgesi.
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Launch Github', // Github'u başlatan buton metni.
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
