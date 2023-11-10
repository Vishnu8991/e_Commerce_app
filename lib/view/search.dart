import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ommerce_app/controller/data_controller.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:e_ommerce_app/view/components/data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final DataController dataController = Get.find();

  List<Product> searchResults = [];

  void searchProducts(String query) {
    searchResults = dataController.dataList
        .where((product) =>
            product.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: Text('Search Products'),
      ),
      body: Column(
        children: [
          Container(height: 80,color: Colors.grey[900],
          padding: EdgeInsets.only( bottom: 5, right: 15, left: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                fillColor: Colors.blue[50],
                filled: true,
                hintText: 'Search for products...',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: searchProducts,
            ),
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: searchResults.length,
            //   itemBuilder: (context, index) {
            //     Product product = searchResults[index];
            //     return ListTile(
            //       title: Text(product.title!),
            //       // Add other information about the product here
            //     );
            //   },
            // ),
            child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: searchResults.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250
                ),
                itemBuilder: ((context, index) {
                  // String title = dataController.dataList[index].title ?? "";
                  Product product = searchResults[index];
                  return GestureDetector(
                    onTap: () => Get.to(DataPage(product: product)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                        // color: Colors.black,
                        padding: EdgeInsets.only(top: 10,right: 10, left: 10, bottom: 5),
                        child: Column(
                          children: [
                            // Text(dataController.dataList[index].title ?? ''),
                            Container(
                              child: Expanded(child: CachedNetworkImage(imageUrl: product.images![0],  height: 135,)),
                              ),
                    
                              SizedBox(height: 5,),
                    
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                SizedBox(height: 5,),
                    
                                Text(product.title!,maxLines: 2 ,style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: 1),),
                    
                                SizedBox(height: 5,),
                    
                                Row(
                                  children: [
                                    Text("\$${product.price!}",style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1),),
                                    
                                    SizedBox(width: 8,),
                  
                                    Text(
                                      "\$${(product.price! / (1 - (product.discountPercentage! / 100))).toStringAsFixed(2)}",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                
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
                            
                            
                                ],
                              ),),
                            ),
                    
                            
                            
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
          ),
        ],
      ),
    );
  }
}
