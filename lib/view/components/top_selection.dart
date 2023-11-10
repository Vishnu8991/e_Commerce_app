import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/view/components/viewAll.dart';
import 'package:e_ommerce_app/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Top_Selection extends StatelessWidget {
  // const Top_Selection({super.key});
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Selection", style: TextStyle(color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.bold),),
              TextButton(onPressed: (){
                Get.to(ViewAll());
              }, child: Text("View All", style: TextStyle(color: Colors.white,),)),
            ],
        ),
        SizedBox(height: 10),
        Obx(() => Container(
          height: 377,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: productController.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 190,
            crossAxisCount: 3), 
          itemBuilder: (context, index){
            ProductModel product = productController.productList[index];
            return GestureDetector(
              onTap: (){
                Get.to(ProductPage(product: product,));
              },
              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Card(color: Colors.black,
                  child: Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Container(
                        padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.white),
                          child: CachedNetworkImage(imageUrl: product.image!, fit: BoxFit.contain,width: double.infinity,))),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.black),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.title!,maxLines: 2,style: TextStyle(color: Colors.grey[300]),),
                              SizedBox(height: 8,),
                              Text("\$${product.price!}",style: TextStyle(color: Colors.grey[300]),),
                            ],
                          )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ))
      ],
    );
  }
}