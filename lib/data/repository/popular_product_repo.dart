import 'package:get/get.dart';
import 'package:mysecondapp/data/api/apiClient.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient
        .getData("https://jsonplaceholder.typicode.com/posts");
  }
}
