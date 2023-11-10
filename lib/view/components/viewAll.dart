import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:e_ommerce_app/view/product_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(home: ViewAll(),));
}

class ViewAll extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text("Top Selections"),backgroundColor: Colors.black,),
      body: 
      Obx(() => ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: ((context, index) {
            ProductModel product = productController.productList[index];
          return GestureDetector(
            onTap: () => Get.to(ProductPage(product: product)),
            child: Card(
              child: Container(height: 150,padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: CachedNetworkImage(imageUrl: product.image!, fit: BoxFit.contain,)
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.title!, maxLines: 2,),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                RatingBar.builder(
                                              initialRating: product.rating!.rate!,
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
                                        SizedBox(width: 10,),
                                        Text("${product.rating!.count} ratings", style: TextStyle(color: Colors.blue),),
                              ],
                            ),
          
                            SizedBox(height: 15),
                              
                            Row(
                          children: [
                            Text("25% off", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: 1,),),
                            SizedBox(width: 15,),
                            Text("\₹${(product.price! / (1 - (25 / 100))).toStringAsFixed(2)}", style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: 1, color: Colors.grey[600] ),),
                            SizedBox(width: 15,),
                            Text("\₹${product.price!}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey[800], letterSpacing: 1),)
                          ],
                        ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}