import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:http/http.dart' as http;

class HttpProductService{
  static Future<dynamic> fetchProduct() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      var data = response.body;
      return productModelFromJson(data);
    }else{
      throw Exception();
    }
  }
}