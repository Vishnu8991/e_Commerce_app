import 'package:http/http.dart' as http;
class HttpDataService{
  static Future<dynamic> fetchData() async{
  var response = await http.get(Uri.parse("https://dummyjson.com/products"));
  if(response.statusCode == 200){
    return response.body;
  } else{
    throw Exception();
  }
  }
}