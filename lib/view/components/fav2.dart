import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/data_controller.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DataFav extends StatelessWidget {
  // const DataFav({super.key});

  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("My Wishlist"),),
      body:
      Obx(() =>  GridView.builder(
        itemCount: dataController.fav.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 290,
          crossAxisCount: 2), 
        itemBuilder: ((context, index) {
          Product product = dataController.fav[index];
          return Card(
                            child: Container(padding: EdgeInsets.only(bottom: 5, left: 10,right: 10),
                              color: Colors.black12,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Container(height: 140,alignment: Alignment.center,
                                    child: CachedNetworkImage(imageUrl: product.images![0], fit: BoxFit.fill,)),
                                    SizedBox(height: 8,),
                                    Text(product.title!,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 2,),
                                    SizedBox(height: 5,),
                                    Expanded(
                                      child: Container(
                                        // margin: EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                        SizedBox(height: 5,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text("\$${product.price!}",style: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text("(inc. all Taxes)", style: TextStyle(fontSize: 10, letterSpacing: 1, color: Colors.grey[900] ),),
                                        SizedBox(height: 5,),
                                              ],
                                            ),
                                            Padding(
                                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                                      child: IconButton(onPressed: (){
                                        dataController.removeFromFav(product);
                                      }, icon: Icon(Icons.favorite, size: 26, color: Colors.red,)),
                                    )
                                          ],
                                        ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                ],
                            ),
                            ),
                          );
        })),)
    ));
  }
}