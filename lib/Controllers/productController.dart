import 'package:get/state_manager.dart';
import 'package:rest_api_getx/Models/product.dart';
import 'package:rest_api_getx/Services/remoteservices.dart';


class ProductController extends GetxController{

  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  //Calling Data From Products
  void fetchProduct()async{
    try {
      isLoading(true);
      //Here We Have All data which we have fetched in remote server
      var products =  await RemoteServices.fetchProduct();
      //if We have Data
      if(productList != null){
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}