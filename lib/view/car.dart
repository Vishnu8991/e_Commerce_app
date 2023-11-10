import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/data_controller.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:e_ommerce_app/view/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(home: Car(),debugShowCheckedModeBanner: false,));
}
class Car extends StatelessWidget {
  Car({super.key});

  final ProductController productController = Get.find();
  final DataController dataController = Get.find();

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("MY CART", style: TextStyle(letterSpacing: 1,),),backgroundColor: Colors.black,elevation: 0
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: 
                      Obx(() => 
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 350
                          // childAspectRatio: 1,
                        ),
                        itemCount: productController.cartList.length, // Change this as per your requirement
                        itemBuilder: (BuildContext context, int index) {
                          ProductModel pro = productController.cartList[index];
                          return Card(
                            child: Container(padding: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(height: 130,alignment: Alignment.center,
                                    child: CachedNetworkImage(imageUrl: pro.image!, fit: BoxFit.fill,)),
                                    SizedBox(height: 8,),
                                    Text(pro.title!,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 2,),
                                    SizedBox(height: 5,),
                                    Expanded(
                                      child: Container(margin: EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                        SizedBox(height: 5,),
                                        Text("\$${pro.price!}",style: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text("(inc. all Taxes)", style: TextStyle(fontSize: 10, letterSpacing: 1, color: Colors.grey[900] ),),
                                        SizedBox(height: 5,),

                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(onPressed: (){
                                              productController.decrementQuantity(index);
                                                    }, icon: Icon(Icons.remove,)),

                                            SizedBox(width: 5,),

                                          Obx(() => Text("${productController.quantityList[index]}", style: TextStyle(fontSize: 16),)),

                                            SizedBox(width: 5,),

                                            IconButton(onPressed: (){
                                              productController.incrementQuantity(index);
                                                    }, icon: Icon(Icons.add)),   

                                          ],
                                        ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25,),
                                      child: ElevatedButton(
                                        onPressed: (){
                                          productController.removeFromCart(index);
                                        }, 
                                        child: Text("Remove", style: TextStyle( fontSize: 13,color: Colors.black, fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5)),
                                      ),
                                    ),
      
                                ],
                              ),
                            ),
                          );
                        },
                      ),)
                    ),
                    Expanded(
                      child: 
                      Obx(() => 
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          // childAspectRatio: 1,
                          mainAxisExtent: 350
                        ),
                        itemCount: dataController.carts.length, // Change this as per your requirement
                        itemBuilder: (BuildContext context, int index) {
                          Product product = dataController.carts[index];
                          return Card(
                            child: Container(padding: EdgeInsets.only(bottom: 5, left: 10,right: 10),
                              color: Colors.black12,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Container(height: 130,alignment: Alignment.center,
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
                                        Text("\$${product.price!}",style: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text("(inc. all Taxes)", style: TextStyle(fontSize: 10, letterSpacing: 1, color: Colors.grey[900] ),),
                                        SizedBox(height: 5,),

                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(onPressed: (){
                                                dataController.decrementQuantity(index);
                                                    }, icon: Icon(Icons.remove,)),

                                            SizedBox(width: 5,),

                                            Obx(() => Text("${dataController.quantityList[index]}", style: TextStyle(fontSize: 16),)),

                                            SizedBox(width: 5,),

                                            IconButton(onPressed: (){
                                              dataController.incrementQuantity(index);
                                                    }, icon: Icon(Icons.add)),   

                                          ],
                                        ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25,),
                                      child: ElevatedButton(
                                        onPressed: (){
                                          dataController.removeFromCart(index);
                                        }, 
                                        child: Text("Remove", style: TextStyle( fontSize: 13,color: Colors.black, fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5)),
                                      ),
                                    ),
      
                                ],
                            ),
                            ),
                          );
                        },
                      ),
                    ),)
                  ],
                ),
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
                      child: 
                      Obx(() => Text(
                            "Total: \$${productController.total.value + dataController.total.value}", style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold, letterSpacing: 1),)),
                                    ),),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Get.to(Payments(totalAmount: productController.total.value + dataController.total.value));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        color: Colors.cyan[800],
                        child: 
                        Text("Place Order", style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold, letterSpacing: 1),)),
                    ),
                  ),
                  
                ],
              )
            )
            ],
          ),
      ),
      ),
    );
  }
}