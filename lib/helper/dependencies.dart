import 'package:get/get.dart';
import 'package:mysecondapp/controller/popular_product_controller.dart';
import 'package:mysecondapp/data/api/apiClient.dart';
import 'package:mysecondapp/data/repository/popular_product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() =>
      ApiClient(appBaseUrl: "https://jsonplaceholder.typicode.com/posts"));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
