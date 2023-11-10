import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/data_controller.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main(){
  runApp(GetMaterialApp(home: CartPage(),debugShowCheckedModeBanner: false,));
}

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final ProductController productController = Get.find();
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
    appBar: AppBar(title: Text("MY CART", style: TextStyle(letterSpacing: 1,),),backgroundColor: Colors.black,elevation: 0,),
      body: Column(
        children: [
          Expanded(
            child: 
            Obx(() => 
            ListView.builder(
              itemCount: dataController.carts.length,
              itemBuilder: (context, index){
              if (index < dataController.carts.length &&
                        index < productController.cartList.length) {
                      Product product = dataController.carts[index];
                      ProductModel pro = productController.cartList[index];
              return Card(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black12,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            child: Column(
                              children: [
                                // Image.asset("assets/img/mob.jpg", height: 120,),
                                CachedNetworkImage(imageUrl: product.images![0], height: 120),
                              ],
                            ),),
                            SizedBox(width: 10,),
                          Container(
                            child: Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title!,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 2,),
                                  SizedBox(height: 8,),
                                        
                                  RatingBar.builder(
                                          initialRating: product.rating!,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 14,
                                          unratedColor: Colors.grey,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                  
                                  SizedBox(height: 8,),
                                  Text("${product.price!}", style: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.bold),),
                                  Text("(inc. all Taxes)", style: TextStyle(fontSize: 10, letterSpacing: 1, color: Colors.grey[900] ),),
                                  SizedBox(height: 8,),
                                  // Text("1,14,900", style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 13, letterSpacing: 1, color: Colors.black ),),
                                  // SizedBox(height: 12,),
                                        
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        dataController.removeFromCart(index);
                                      }, 
                                      child: Text("Remove", style: TextStyle( fontSize: 15,color: Colors.black, fontWeight: FontWeight.bold)),
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black12,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            child: Column(
                              children: [
                                // Image.asset("assets/img/mob.jpg", height: 120,),
                                CachedNetworkImage(imageUrl: pro.image!, height: 120),
                              ],
                            ),),
                            SizedBox(width: 10,),
                          Container(
                            child: Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pro.title!,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 2,),
                                  SizedBox(height: 8,),
                                        
                                  RatingBar.builder(
                                          initialRating: pro.rating!.rate!,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 14,
                                          unratedColor: Colors.grey,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                  
                                  SizedBox(height: 8,),
                                  Text("${pro.price!}", style: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.bold),),
                                  Text("(inc. all Taxes)", style: TextStyle(fontSize: 10, letterSpacing: 1, color: Colors.grey[900] ),),
                                  SizedBox(height: 8,),
                                  // Text("1,14,900", style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 13, letterSpacing: 1, color: Colors.black ),),
                                  // SizedBox(height: 12,),
                                        
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        productController.removeFromCart(index);
                                      }, 
                                      child: Text("Remove", style: TextStyle( fontSize: 15,color: Colors.black, fontWeight: FontWeight.bold)),
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );}
            }),)
          ),
          Container(
            height: 50,
            // width: double.infinity,
            color: Colors.grey[900],
            child:
             Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.red,
                    height: double.infinity,
                    child: Text("₹87,990", style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold, letterSpacing: 1),)),
                ),
                Flexible(
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      color: Colors.cyan[800],
                      child: Text("Place Order", style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold, letterSpacing: 1),)),
                  ),
                ),
                
              ],
            )
          )
        ],
      ),
    );
  }
}