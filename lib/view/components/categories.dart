import 'package:flutter/material.dart';

class Categories extends StatelessWidget {

  var img = [
        "assets/img/t1.png",          
        "assets/img/watch.png",          
        "assets/img/lap.png",          
        "assets/img/headset.png",          
        "assets/img/s1.png",          
        "assets/img/m1.png",          
  ];

  var text = [
        "Dress",
        "Watch",
        "Laptop",
        "Headset",
        "Shoes",
        "Smartphones"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category", style: TextStyle(color: Colors.grey[300], fontSize: 18,),),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right, size: 32, color: Colors.white,))
                 
              )
            ],
          ),
          Container(
            height: 110,
            child: ListView.builder(
              itemCount: img.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return Container(padding: EdgeInsets.only(right: 19, top: 8, bottom: 15, left: 9),
            color: Colors.grey[900],
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey[600], borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(img[index],fit: BoxFit.fill,)),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(text[index], style: TextStyle(color: Colors.grey[300]),)
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}