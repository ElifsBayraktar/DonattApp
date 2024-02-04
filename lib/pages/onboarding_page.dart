import 'package:flutter/material.dart';

import '../models/onboarding_model.dart';
import '../widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Onboarding sayfalarının özelliklerini içeren model listesi
  List<OnboardingModel> onbList = [
    OnboardingModel(
      'lib/images/onb1.png',
      'Select a restaurant',
      'You can order your food from any restaurant you want.',
    ),
    OnboardingModel(
      'lib/images/onb2.png',
      'Order the food',
      'You can order any hot meal you want.',
    ),
    OnboardingModel(
      'lib/images/onb3.png',
      'Deliver to home',
      'Have your food delivered hot to your door within minutes',
    ),
  ];

  // Sayfa kontrolcüsü
  PageController controller = PageController();

  // Geçerli sayfa indeksi
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Ekran boyutunu almak için MediaQuery kullanılıyor
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: onbList.length,
        onPageChanged: (value) {
          // Sayfa değiştiğinde indeksi güncelle
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  onbList[index].image,
                  height: size.height * 0.3,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03,
                      ),
                      child: Text(
                        onbList[index].title,
                        style: const TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.01,
                      ),
                      child: Text(
                        onbList[index].description,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onbList.length,
                          (index) => Container(
                            height: 5,
                            width: currentIndex == index ? 30 : 5,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == index
                                  ? Colors.deepOrange
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      text: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          // Eğer son sayfadaysa 'Welcome' sayfasına yönlendir
                          if (currentIndex == onbList.length - 1) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/welcome',
                              (route) => false,
                            );
                          }
                        });
                        // Sayfayı bir sonrakine geçir
                        controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
