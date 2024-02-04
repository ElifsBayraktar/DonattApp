import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //CONTROLLERLAR OLUŞTURULDU
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController fullNameController =
      TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  final TextEditingController passwordAgainController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    //SAYFA AÇILINCA KAYDEDİLERN VERİYİ GÖSTER
    readData();
  }

  //YENİ KAYIT OLUŞTURURKEN VERİLERİ VERİTABANINA KAYDETMEK İÇİN
  storeData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();

    storeage.setString("email", emailController.text);
    storeage.setString("fullName", fullNameController.text);
    storeage.setString("password", passwordController.text);
    storeage.setString("again", passwordAgainController.text);
  }

  //KAYDEDİLEN VERİYİ OKUMAK İÇİN
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var email = storeage.getString("email");
    var fullName = storeage.getString("fullName");
    var password = storeage.getString("password");
    var passwordAgain = storeage.getString("again");

    setState(() {
      emailController.text = email ?? '';
      fullNameController.text = fullName ?? '';
      passwordController.text = password ?? '';
      passwordAgainController.text = passwordAgain ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: size.height * 0.05),
                            const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(height: size.height * 0.02),
                            CustomTextField(
                              labeltext: 'E-mail',
                              icon: const Icon(Icons.mail),
                              obsecureText: false,
                              controller: emailController,
                            ),
                            CustomTextField(
                              labeltext: 'Full Name',
                              icon: const Icon(Icons.person),
                              obsecureText: false,
                              controller: fullNameController,
                            ),
                            CustomTextField(
                              icon: const Icon(Icons.key),
                              labeltext: 'Password',
                              obsecureText: true,
                              controller: passwordController,
                            ),
                            CustomTextField(
                              icon: const Icon(Icons.key),
                              labeltext: 'Password Again',
                              obsecureText: true,
                              controller: passwordAgainController,
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
                                  onPressed: () {
                                    //EĞER KONTROLLERLAR BOŞSA UYARI VERMESİ İÇİN İF
                                    if (emailController.text.isEmpty ||
                                        fullNameController.text.isEmpty ||
                                        passwordController.text.isEmpty ||
                                        passwordAgainController.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Please fill in all fields.')));
                                      //EĞER Kİ ŞİFRELER EŞİT DEĞİLSE UYARI VERECEK
                                    } else if (passwordController.text !=
                                        passwordAgainController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor: Colors.white,
                                              content: Text(
                                                  'Please enter the same passwords.',
                                                  style: TextStyle(
                                                      color: Colors.black))));
                                    } else {
                                      //HER ŞEY NORMAL İSE HOME SAYFASINA YÖNLENDİRECEK VE VERİLERİ VERİTABANINA KAYDEDECEK
                                      storeData();
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/home', (route) => false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor: Colors.white,
                                              content: Text('Data Saved',
                                                  style: TextStyle(
                                                      color: Colors.black))));
                                    }
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
