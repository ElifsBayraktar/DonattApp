import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //MAİL CONTROLLER OLUŞTURDUK
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController fullNameController = TextEditingController(text: "");

  //VERİTABANINA KAYDETTİĞİMİZ MAİLİ UYGULAMA AÇILINCA OKUMAK İÇİN
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var email = storeage.getString("email");
    var fullName = storeage.getString("fullName");

    setState(() {
      emailController.text = email ?? '';
      fullNameController.text = fullName ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //BU SAYFA AÇILINCA VERİYİ GÖSTER
    readData();
  }

  //VERİTABANINA KAYDEDİLEN VERİYİ SİLMEK İÇİN. YANİ ÇIKIŞ YAPMAK İÇİN LOGOUT
  clearData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300'), radius: 70),
              SizedBox(height: size.height * 0.02),
              Text(
                //EĞER YENİ BİR KAYIT OLUŞTURUYORSA PROFİLDE O KISMIN MAİL ADRESİ YAZSIN EĞER SERVİSTEKİ KULLANICI İLE GİRİŞ YAPIYORSA ONU GÖSTERMESİ İÇİN SORGU
                emailController.text.isNotEmpty ? emailController.text : 'eve.holt@reqres.in',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(fullNameController.text.isEmpty ? '' : fullNameController.text),
              SizedBox(height: size.height * 0.4),
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
                      //LOGOUT TUŞUNA BASINCA VERİYİ SİLİP welcome SAYFASINA ATIYOR
                      clearData();
                      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        )));
  }
}
