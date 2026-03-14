import 'package:dio/dio.dart';
import 'package:flower_app/core/dio/dio_helper.dart';
import 'package:flower_app/features/cart/data/data_source/cart_remote_ds.dart';
import 'package:flower_app/features/cart/data/models/cart_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDs)
class CartRemoteDsImpl implements CartRemoteDs {
  @override
  Future<CartModel> addToCart(String token, String productId, int quantity) async {
    try {
      final response = await DioHelper.postData(
        url: "https://flower.elevateegy.com/api/v1/cart",
        data: {
          "product": productId,
          "quantity": quantity,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("response status: ${response.statusCode}");
      print("response data: ${response.data}");

      return CartModel.fromJson(response.data); // or however your model parses

    } on DioError catch (e) {
      if (e.response != null) {
        print("Status code: ${e.response?.statusCode}");
        print("Response data: ${e.response?.data}");
        // Show error message to user
        throw Exception(e.response?.data['error'] ?? "Failed to add product");
      } else {
        // Network or other error
        throw Exception("Something went wrong. Please try again.");
      }
    }
  }
  
}