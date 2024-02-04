import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../service/login_service.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //SERVİSİ BURADA KULLANMAK İÇİN NESNSEYİ OLUŞTURUYORUZ
  final Service service = Service();

  //VERİLERİ UYGULAMA KAPANIRSA VEYA YENİDEN BAŞLATILIRSA DİYE SAKLAMAK İÇİN SHAREDPREFERENCES KULLANDIK. LOCAL VERİTABANI
  storeData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.setString("Email", _emailController.text);
  }

  //KAYDETTİĞİMİZ VERİLERİ EKRANDA GÖSTERMEK İÇİN YAZILDI
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var mail = storeage.getString("Email");

    setState(() {
      _emailController.text = mail ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //BU SAYFA AÇILDIĞINDA KAYDEDİLEN VERİLERİ EKRANDA GÖSTERMEK İÇİN
    readData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: size.height * 0.05),
                          const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          SizedBox(height: size.height * 0.05),
                          CustomTextField(
                            labeltext: 'E-mail',
                            icon: const Icon(Icons.mail),
                            obsecureText: false,
                            controller: _emailController,
                          ),
                          CustomTextField(
                            icon: const Icon(Icons.key),
                            labeltext: 'Password',
                            obsecureText: true,
                            controller: _passwordController,
                          ),
                          SizedBox(height: size.height * 0.05),
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
                                onPressed: () async {
                                  //WEB SERVİSE ATTIĞIMIZ İSTEK İLE GİRİLEN ŞİFRE EŞİT Mİ DEĞİL Mİ KONTROLU YAPILIYOR
                                  if (_passwordController.text == 'satosi' &&
                                      _emailController.text ==
                                          'eve.holt@reqres.in') {
                                    //EŞİTSE GİRİŞ BAŞARILI OLUYOR VE VERİLER VERİTABANINA KAYIT EDİLİYOR
                                    service.login(_emailController.text,
                                        _passwordController.text);
                                    storeData();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.white,
                                            content: Text('login success',
                                                style: TextStyle(
                                                    color: Colors.black))));
                                    await Navigator.pushNamedAndRemoveUntil(
                                        context, '/home', (route) => false);
                                  } else {
                                    //DEĞİLSE ŞİFRE HATALI
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.white,
                                            content: Text('Login failed',
                                                style: TextStyle(
                                                    color: Colors.black))));
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Don’t have an account?',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/register', (route) => false);
                                    },
                                    child: const Text(
                                      'create',
                                      style:
                                          TextStyle(color: Colors.deepOrange),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
