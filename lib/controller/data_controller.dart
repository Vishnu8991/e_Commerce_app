import 'dart:convert';

import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/models/product_model2.dart';
import 'package:e_ommerce_app/service/data_api_service.dart';
import 'package:get/get.dart';

class DataController extends GetxController{

  final ProductController productController = Get.find();

   var dataList = <Product>[].obs;
   var carts = [].obs;
   var total = 0.0.obs;
   var fav = [].obs;
   var favorites = <Product, bool>{}.obs;
   var quantityList = <int>[].obs;

  
   

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  
  void getData() async{
    try{
      var response = await HttpDataService.fetchData();
      var jsonData = json.decode(response);
      DataModel dataModel = DataModel.fromJson(jsonData);
      dataList.value = dataModel.products!; 
    } catch(e){
      print(e);
    }
  }

  void addToCarts(Product product) {
    carts.add(product);
    quantityList.add(1);
    updateTotal();
  }

  void addToFav(Product product) {
  fav.add(product);
  favorites[product] = true;
  update();
}

 void removeFromFav(Product product) {
  fav.remove(product);
  favorites[product] = false;
  update();
}

  void removeFromCart(int index) {
    carts.removeAt(index);
    quantityList.removeAt(index);
    updateTotal();
  }

  void updateTotal() {
    double totalPrice = 0.0;

    for (var i = 0; i < carts.length; i++) {
      totalPrice += (carts[i].price! * quantityList[i]);
    }

    total.value = totalPrice; // Update the total price
  }


void incrementQuantity(int index) {
    quantityList[index]++;
    updateTotal();
  }

  void decrementQuantity(int index) {
    if (quantityList[index] > 1) {
      quantityList[index]--;
      updateTotal();
    }
  }


  


  void toggleFavorite(Product product) {
  if (favorites.containsKey(product)) {
    bool isFavorite = favorites[product]!;
    if (isFavorite) {
      removeFromFav(product);
    } else {
      addToFav(product);
    }
  } else {
    addToFav(product);
  }
}
}

  // void moveToPro(ProductModel product) {
  //   ProductModel productModel = ProductModel(
  //     title: product.title, price: product.price,
  //   );
  //   productController.addToCart(product);
  // }
