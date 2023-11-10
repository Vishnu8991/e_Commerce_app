import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProFav(),
  ));
}

class ProFav extends StatelessWidget {
  // const ProFav({super.key});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.grey[900],
              title: Text("My Wishlist"),
            ),
            body: Obx(
              () => GridView.builder(
                  itemCount: productController.fav.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 290),
                  itemBuilder: ((context, index) {
                    ProductModel productModel = productController.fav[index];
                    return Card(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        color: Colors.black12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 140,
                                alignment: Alignment.center,
                                child: CachedNetworkImage(
                                  imageUrl: productModel.image!,
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              productModel.title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: productModel.rating!.rate!,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 14,
                                      unratedColor: Colors.grey,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "\$${productModel.price!}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "(inc. all Taxes)",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  letterSpacing: 1,
                                                  color: Colors.grey[900]),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, bottom: 12),
                                          child: IconButton(
                                            onPressed: () {
                                              ProductModel productModel =
                                                  productController.fav[index];
                                              productController
                                                  .removeFromFav(productModel);
                                            },
                                            icon: Icon(Icons.favorite,
                                                size: 26, color: Colors.red),
                                          ),
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
                  })),
            )));
  }
}
