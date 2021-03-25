import 'package:http/http.dart' as http;
import 'package:rest_api_getx/Models/product.dart';


class RemoteServices{
  static var client = http.Client();

  // Fetching Products
  // Here and pass to controller
  static Future<List<Product>> fetchProduct() async{
    var response = await client.get('https://makeup-api.herokuapp.com/api/v1/products.json');

    if(response.statusCode == 200){
      var jsonString = response.body;
      return productFromJson(jsonString);
    }else{
      //Show Error Message
      return null;
    }
  }
}