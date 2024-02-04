import 'package:flutter/material.dart';

import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/profile_page.dart';
import 'pages/register_page.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //uygulamanın başlayacağı sayfa
      initialRoute: '/onboarding',
      //Navigatorlar yani sayfaların ismi isimlere göre geçiş yapılıyor
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/welcome': (context) => const WelcomePage(),
        '/contact': (context) => const ContactPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
