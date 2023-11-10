import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/view/components/fav1.dart';
import 'package:e_ommerce_app/view/components/fav2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(home: Wishlist(),));
}

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Colors.grey[800],
      appBar: AppBar(title: Text("Wishlist", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 20),),backgroundColor: Colors.transparent,elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: ()=> Get.to(DataFav()),
                  child: Container(padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[900]
                    ),
                    height: 160,
                    child: Column(
                      children: [
                       Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                  Image.asset("assets/img/se.jpg"),
                                  SizedBox(width: 12,),
                                  Image.asset("assets/img/girl.png"),
                                ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                  Image.asset("assets/img/boss.png"),
                                  SizedBox(width: 12,),
                                  Image.asset("assets/img/headset.png"),
                                ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text("Festive Deals", style: TextStyle(letterSpacing: 1.2,fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward, color: Colors.white,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> Get.to(ProFav()),
                  child: Container(padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[900]
                    ),
                    height: 160,
                    child: Column(
                      children: [
                       Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                  Image.asset("assets/img/watch.png"),
                                  SizedBox(width: 12,),
                                  Image.asset("assets/img/mob.jpg"),
                                ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                  Image.asset("assets/img/lap.png"),
                                  SizedBox(width: 12,),
                                  Image.asset("assets/img/shoe.png"),
                                ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text("Top Selection", style: TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward, color: Colors.white,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}