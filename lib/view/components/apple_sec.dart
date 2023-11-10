import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Apple extends StatelessWidget {

  var img = [
    "assets/img/13.png",
    "assets/img/i14.jpg",
    "assets/img/i13.jpg",
    "assets/img/i12.jpg",
    "assets/img/se.jpg",
  ];

  var phone = [
    "iPhone 15",
    "iPhone 14",
    "iPhone 13",
    "iPhone 12",
    "iPhone se",
  ];

  var price = [
    "74,999*",
    "60,999*",
    "53,999*",
    "44,999*",
    "33,999*",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Apple at Maxx", style: TextStyle(color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.bold),),
            Icon(Icons.arrow_right, size: 32, color: Colors.white,)
          ],
        ),

        SizedBox(height: 10,),

        Container(
          height: 260,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Colors.grey.shade200,
                  Colors.white,
                ])),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 34),
                      child: Column(
                      children: [
                    Image.asset("assets/img/apple.png", height:15,),
                    SizedBox(height: 10,),
                    Text(phone[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                    SizedBox(height: 7,),
                    Row(
                      children: [
                        Text("Starting at ", style: TextStyle(fontSize: 11)),
                        Text(price[index], style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text("*inclusive of all Offers", style: TextStyle(fontSize: 10),),
                      ],
                    ),),
                    SizedBox(height: 14,),
                    Expanded(child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      child: Image.asset(img[index],)))
                  ],
                ),
              ),
            );
          })),
        )
      ],
    );
  }
}