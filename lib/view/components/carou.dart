import 'package:e_ommerce_app/view/components/stc.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousal extends StatefulWidget {

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  int activeIndex = 0;
  var txt = [
            "Trending deals",
            "Pick your gadgets",
            "Festive offers",
            "Game like a pro",
            "Best Picks on"
            ];

  var stxt1 = [
            "on Men's Shoes",
            "Offer on Headsets",
            "Huge Discount for",
            "with latest Geforce RTX",
            "Neckband latest edition"
            ];

  var stxt2 = [
            "Grab now",
            "check it out",
            "the first transaction",
            "FHD 144 Hz",
            "Bluetooth 5.2"
            ];

  var col = [
            const Color.fromARGB(255, 14, 127, 220),
            Colors.grey.shade900,
            Colors.black,
            const Color.fromARGB(255, 60, 2, 2),
            Colors.cyan,
            ];

  var col1 = [
            const Color.fromARGB(255, 1, 52, 93),
            Colors.grey.shade500,
            Colors.black,
            Colors.black,
            const Color.fromARGB(255, 1, 95, 107),
            ];

  var elevatedc = [
            Colors.black,
            Colors.green,
            const Color.fromARGB(255, 49, 8, 1),
            Colors.red[900],
            Colors.cyan,
  ];

  var img = [
          "assets/img/shoe.png",
          "assets/img/boss.png",
          "assets/img/men.jpg",
          "assets/img/lap.png",
          "assets/img/nk.png",
  ];

  var l = [190,225,215,170,205];

  var h = [160,145,150,200,145]; 

  var t = [-10,8,25,2,0]; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: txt.length, itemBuilder: ((context, index, realIndex){
              return 
              Stacks(txt: txt[index],stxt1: stxt1[index], stxt2: stxt2[index],col: col[index], col1: col1[index], elevatedc: elevatedc[index], img: img[index], l: l[index], h: h[index], t: t[index],);
              }), 
              
              options: CarouselOptions(
            initialPage: 0,
            // height: 300,
            // aspectRatio: 16/9,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayCurve: Curves.linear,
            // enlargeCenterPage: true,
            // enlargeFactor: .3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          )),
          buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: txt.length,
      effect: ScrollingDotsEffect(
        activeDotColor: Colors.black,
        dotHeight: 9,
        dotWidth: 9,
        strokeWidth:  1.5
      ),
    );
  }
}