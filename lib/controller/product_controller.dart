import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/service/product_api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  // var isLoading = true.obs;
  var productList = [].obs;

  var cartList = [].obs;

  var total = 0.0.obs;

  var fav = [].obs;

  var quantityList = <int>[].obs;
  

  var favorites = <ProductModel, bool>{}.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
  
  void getProducts() async{
    try{
      // isLoading(true);
      var products = await HttpProductService.fetchProduct();
      if(products != null){
        productList.value = products;
      }
    }catch(e){
      print(e);
    }
  }

  void addToCart(ProductModel product) {
    cartList.add(product);
    quantityList.add(1); // Add this line
    updateTotal();
  }

  void addToFav(ProductModel product) {
  fav.add(product);
  favorites[product] = true;
  update();
}

   void removeFromFav(ProductModel product) {
  fav.remove(product);
  favorites[product] = false;
  update();
}

void removeFromCart(int index) {
    cartList.removeAt(index);
    quantityList.removeAt(index); // Remove quantity from list
    updateTotal();
  }

  void updateTotal() {
    double totalPrice = 0.0;

    for (var i = 0; i < cartList.length; i++) {
      totalPrice += (cartList[i].price! * quantityList[i]);
    }

    total.value = totalPrice;
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
  
void toggleFavorite(ProductModel product) {
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