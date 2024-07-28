 
import 'package:flutter/material.dart';
  
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _currentIndex = 0;

  final List<String> imageUrls = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageUrls.map((imageUrl) {
            return Image.asset(imageUrl, fit: BoxFit.cover);
          }).toList(),
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageUrls.map((imageUrl) {
            int index = imageUrls.indexOf(imageUrl);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
