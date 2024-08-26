import 'package:flutter/material.dart';
import 'Login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Boarding> onboardingData = [
      Boarding(
        image: "assets/images/WhatsApp Image 2024-08-25 at 18.37.27_936c4ab7.jpg",
        title: "Find Favorite Items",
        description: "Find your favorite products that you want to buy easily",
      ),
      Boarding(
        image: "assets/images/WhatsApp Image 2024-08-25 at 18.37.27_b2e45761.jpg",
        title: "Easy and Safe Payment",
        description: "Pay for the products you buy safely and easily",
      ),
      Boarding(
        image: "assets/images/WhatsApp Image 2024-08-25 at 18.37.27_b2e45761.jpg",
        title: "Product Delivery",
        description: "Your product is delivered to your home safely ",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepOrange,
                backgroundColor: Colors.black,// Text color

              ),
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    pageIndex: index,
                    onboardingData: onboardingData,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Boarding {
  final String image, title, description;
  Boarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.pageIndex,
    required this.onboardingData,
  });

  final int pageIndex;
  final List<Boarding> onboardingData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Image.asset(onboardingData[pageIndex].image),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onboardingData.length,
                  (index) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: DotIndicator(isActive: index == pageIndex),
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          onboardingData[pageIndex].title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          onboardingData[pageIndex].description,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.deepOrange,
          ),
        ),
        const Spacer(),
        pageIndex == 2
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent, // Background color
              foregroundColor: Colors.black, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        )
            : Container(),
        const Spacer(),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? const Color.fromARGB(255, 255, 153, 0)
            : const Color.fromARGB(255, 199, 122, 7),
      ),
    );
  }
}
