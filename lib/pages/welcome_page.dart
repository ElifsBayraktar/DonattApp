// Bu dosya, içerdiği WelcomePage widget'ı ile hoş geldiniz sayfasını tanımlar.
// Widget'lar, Flutter uygulamasında kullanıcı arayüzünü oluşturan temel yapı taşlarıdır.

import 'package:flutter/material.dart';

// WelcomePage sınıfı, hoş geldiniz sayfasını içeren bir StatefulWidget'dir.
class WelcomePage extends StatefulWidget {
  // Constructor, WelcomePage sınıfına ait özellikleri alır.
  const WelcomePage({super.key});

  // WelcomePage sınıfına ait durum (state) sınıfını oluşturan metodun implementasyonu.
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

// _WelcomePageState sınıfı, WelcomePage widget'ının durumunu yönetir.
class _WelcomePageState extends State<WelcomePage> {
  // Widget'ın ekran üzerinde oluşturulmasını sağlayan metod.
  @override
  Widget build(BuildContext context) {
    // Ekran boyutunu almak için MediaQuery kullanılıyor.
    final size = MediaQuery.of(context).size;

    // Scaffold widget'ı, temel materyal tasarımı sağlar.
    return Scaffold(
      // Stack widget'ı, üzerindeki widget'ları üst üste binmiş gibi gösterir.
      body: Stack(
        children: [
          // Arka plan resmini gösteren bir görüntü widget'ı.
          Image.asset(
            'lib/images/welcomeee.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          // Giriş butonunu içeren konumlandırılmış bir konteyner.
          Positioned(
            bottom: size.height * 0.1,
            right: size.width * 0.1,
            left: size.width * 0.1,
            child: SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // 'Login' butonuna tıklandığında '/login' sayfasına geçiş yapılır
                  // ve diğer sayfalar kapatılır.
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          // Kayıt butonunu içeren konumlandırılmış bir konteyner.
          Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.1,
            left: size.width * 0.1,
            child: SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // 'Register' butonuna tıklandığında '/register' sayfasına geçiş yapılır
                  // ve diğer sayfalar kapatılır.
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/register', (route) => false);
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
