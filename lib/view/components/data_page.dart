import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/data_controller.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:e_ommerce_app/view/car.dart';
import 'package:e_ommerce_app/view/cart_page.dart';
import 'package:e_ommerce_app/view/components/fav2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main(){
  runApp(GetMaterialApp(home: DataPage(product: Product(),),debugShowCheckedModeBanner: false,));
}

class DataPage extends StatelessWidget {
  final Product product;
  DataPage({super.key, required this.product});

  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back, size: 25,)),
        // actions: [IconButton(onPressed: (){
        //   dataController.addToFav(product);
        // }, icon: Icon(Icons.favorite_border, size: 25,),),SizedBox(width: 15,)],
        actions: [
        IconButton(
  onPressed: () {
    dataController.toggleFavorite(product);
    if (dataController.favorites[product] == true) {
      Get.snackbar("Successfully", "added to wishlist",duration: Duration(seconds: 1));
    } else {
      Get.snackbar("Successfully", "removed from wishlist",duration: Duration(seconds: 1));
    }
  },
  icon: Obx(() {
    bool isFavorite = dataController.favorites[product] ?? false;
    return Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      size: 25,
      color: isFavorite ? Colors.red : null,
    );
  }),
),
        SizedBox(width: 15,),
      ],
      ),  
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              

              Container(
                alignment: Alignment.center,
                height: 250,
                child: CachedNetworkImage(imageUrl: product.images![0]),
              ),
              SizedBox(height: 10,),  

              Row(mainAxisAlignment: MainAxisAlignment.start,
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
                                
                                SizedBox(width: 10,),

                                Text("${product.stock!} ratings", style: TextStyle(color: Colors.blue),)
                ],
              ),

              SizedBox(height: 10,),

              Text(product.title!, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1),),
              
              SizedBox(height: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Details", style: TextStyle(color: Colors.grey[200], fontSize: 20,),),

                  SizedBox(height: 7,),

                  Text(product.description!,style: TextStyle(color: Colors.grey[400], fontSize: 17, wordSpacing: 1,height: 1.2), maxLines: 2,),
                ],
              ),
              
              SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                color: Colors.black,
                child: Row(
                  children: [
                    Text("${product.discountPercentage}% off", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1,),),
                    SizedBox(width: 15,),
                    Text("\$${(product.price! / (1 - (product.discountPercentage! / 100))).toStringAsFixed(2)}", style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1, color: Colors.grey[600] ),),
                    SizedBox(width: 15,),
                    Text("\$${product.price!}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[300], letterSpacing: 1),)
                  ],
                ),
              ),

              SizedBox(height: 8),

              Container(
                color: Colors.grey[800],
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No", style: TextStyle(color: Colors.grey[300], fontSize: 16),),
                        Text("Returns", style: TextStyle(color: Colors.grey[300], fontSize: 16)),
                      ],
                    )),
                    Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("COD", style: TextStyle(color: Colors.grey[300], fontSize: 16),),
                        Text("Available", style: TextStyle(color: Colors.grey[300], fontSize: 16)),
                      ],
                    )),
                    Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Maxx", style: TextStyle(color: Colors.grey[300], fontSize: 16),),
                        Text("Assured", style: TextStyle(color: Colors.grey[300], fontSize: 16)),
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(height: 8,),


              Container(
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Container( padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[800]
                          ),
                          child: Text("1 Year Warranty",style: TextStyle(color: Colors.grey[300], fontSize: 16))),
                      ),
                    ),
                    Card(
                      child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[800]
                        ),
                        child: Text("7 Days Replacement Policy",style: TextStyle(color: Colors.grey[300], fontSize: 16))),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              
              Spacer(),

              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Get.to(Car());
                      }, 
                      child: Text("Buy Now", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        backgroundColor: Colors.cyan[700], padding: EdgeInsets.symmetric(horizontal: 55, vertical: 20)),
                      ),
                    ElevatedButton(
                      onPressed: (){
                        dataController.addToCarts(product);
                        Get.snackbar("Successfully", "added to cart",duration: Duration(seconds: 1));
                      }, 
                      child: Text("Add to Cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                      style: ElevatedButton.styleFrom(
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        backgroundColor: Colors.red[900], padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20)),
                      ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}