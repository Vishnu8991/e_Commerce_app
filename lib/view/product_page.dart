import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/view/car.dart';
import 'package:e_ommerce_app/view/cart_page.dart';
import 'package:e_ommerce_app/view/components/fav1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

// void main(){
//   runApp(GetMaterialApp(home: ProductPage(),debugShowCheckedModeBanner: false,));
// }

class ProductPage extends StatelessWidget {
  final ProductModel product;
  ProductPage({super.key, required this.product});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back, size: 25,)),
          // actions: [
          //   IconButton(onPressed: (){
          //     productController.addToFav(product);
          //     Get.to(ProFav()); 
          //   }, 
          //   icon: Icon(Icons.favorite_border, size: 25,),),SizedBox(width: 15,)],
        
        actions: [
//         IconButton(
//   onPressed: () {
//     productController.toggleFavorite(product);
//     // Get.to(ProFav());
//   },
//   icon: Obx(() {
//     bool isFavorite = productController.favorites[product] ?? false;
//     return Icon(
//       isFavorite ? Icons.favorite : Icons.favorite_border,
//       size: 25,
//       color: isFavorite ? Colors.red : null,
//     );
//   }),
// ),  
IconButton(
  onPressed: () {
    productController.toggleFavorite(product);
    if (productController.favorites[product] == true) {
      Get.snackbar("Successfully", "added to wishlist",duration: Duration(seconds: 1));
    } else {
      Get.snackbar("Successfully", "removed from wishlist",duration: Duration(seconds: 1));
    }
  },
  icon: Obx(() {
    bool isFavorite = productController.favorites[product] ?? false;
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
                
    
                Expanded(
                  child: Container(alignment: Alignment.center,
                    height: 350,
                    child: CachedNetworkImage(imageUrl: product.image!, fit: BoxFit.fill,),
                  ),
                ),
                SizedBox(height: 20,),  
    
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
    
                                  Text("${product.rating!.count} ratings", style: TextStyle(color: Colors.blue),)
                  ],
                ),
    
                SizedBox(height: 15,),
    
                Text(product.title!, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 1),),
                
                SizedBox(height: 20,),
    
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Details", style: TextStyle(color: Colors.grey[200], fontSize: 20,),),
    
                    SizedBox(height: 10,),
    
                    Text(product.description!,style: TextStyle(color: Colors.grey[400], fontSize: 17, wordSpacing: 1,height: 1.2), maxLines: 4,),
                  ],
                ),
                
                SizedBox(height: 15,),
    
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  color: Colors.black,
                  child: Row(
                    children: [
                      Text("25% off", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1,),),
                      SizedBox(width: 15,),
                      Text("\₹${(product.price! / (1 - (25 / 100))).toStringAsFixed(2)}", style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1, color: Colors.grey[600] ),),
                      SizedBox(width: 15,),
                      Text("\₹${product.price!}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[300], letterSpacing: 1),)
                    ],
                  ),
                ),
    
                SizedBox(height: 15,),
    
                Container(
                  color: Colors.grey[800],
                  height: 70,
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
                SizedBox(height: 12,),
    
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
                          productController.addToCart(product);
                          Get.snackbar("Successfully", "added to cart", duration: Duration(seconds: 1));
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
      ),
    );
  }
}