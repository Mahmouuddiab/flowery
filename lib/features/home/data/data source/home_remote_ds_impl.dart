import 'package:flower_app/core/dio/dio_helper.dart';
import 'package:flower_app/features/home/data/data%20source/home_remote_ds.dart';
import 'package:flower_app/features/home/data/models/best_seller_model.dart';
import 'package:flower_app/features/home/data/models/category_model.dart';
import 'package:flower_app/features/home/data/models/occasion_model.dart';
import 'package:flower_app/features/home/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl implements HomeRemoteDs {
  @override
  Future<List<CategoryModel>> categories() async {
    final response = await DioHelper.getData(
      url: "https://flower.elevateegy.com/api/v1/categories",
    );
    if (response.statusCode == 200) {
      final List data = response.data['categories'];
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception(response.data);
    }
  }

  @override
  Future<List<BestSellerModel>> bestSellers() async {
    final response = await DioHelper.getData(
      url: "https://flower.elevateegy.com/api/v1/best-seller",
    );
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map && data['bestSeller'] is List) {
        return (data['bestSeller'] as List)
            .map((item) => BestSellerModel.fromJson(item))
            .toList();
      } else {
        throw Exception("Unexpected structure: ${response.data}");
      }
    } else {
      throw Exception("Server error: ${response.statusCode}");
    }
  }

  @override
  Future<List<OccasionModel>> occasions()async{
    final response = await DioHelper.getData(url: "https://flower.elevateegy.com/api/v1/occasions");
    if(response.statusCode == 200){
      final List data = response.data['occasions'];
      return data.map((json)=> OccasionModel.fromJson(json)).toList() ;
    }
    else{
      throw Exception(response.data);
    }
  }

  @override
  Future<List<ProductModel>> products(String category) async {
    final response = await DioHelper.getData(
      url: "https://flower.elevateegy.com/api/v1/products?category=$category",
    );

    if (response.statusCode == 200) {
      final List data = response.data['products'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception(response.data);
    }
  }
}
