import 'package:flower_app/features/home/data/data%20source/home_remote_ds.dart';
import 'package:flower_app/features/home/domain/entity/best_seller_entity.dart';
import 'package:flower_app/features/home/domain/entity/category_entity.dart';
import 'package:flower_app/features/home/domain/entity/occasion_entity.dart';
import 'package:flower_app/features/home/domain/entity/product_entity.dart';
import 'package:flower_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDs homeRemoteDs;
  HomeRepositoryImpl({required this.homeRemoteDs});
  @override
  Future<List<CategoryEntity>> categories() async {
    final model = await homeRemoteDs.categories();
    return model
        .map(
          (e) => CategoryEntity(
            id: e.id!,
            name: e.name!,
            slug: e.slug!,
            image: e.image!,
          ),
        )
        .toList();
  }

  @override
  Future<List<BestSellerEntity>> bestSellers() async {
    final model = await homeRemoteDs.bestSellers();
    return model
        .map(
          (e) => BestSellerEntity(
            id: e.id,
            title: e.title,
            imgCover: e.imgCover,
            price: e.price,
          ),
        )
        .toList();
  }

  @override
  Future<List<OccasionEntity>> occasions() async {
    final model = await homeRemoteDs.occasions();
    return model
        .map((e) => OccasionEntity(id: e.id, name: e.name, image: e.image))
        .toList();
  }

  @override
  Future<List<ProductEntity>> products(String category) async {
    final model = await homeRemoteDs.products(category);
    return model
        .map(
          (e) => ProductEntity(
            id: e.id,
            title: e.title,
            imgCover: e.imgCover,
            price: e.price,
            priceAfterDiscount: e.priceAfterDiscount,
            category: e.category,
            images: e.images,
            description: e.description,
            quantity: e.quantity,
            rateAvg: e.rateAvg
          ),
        )
        .toList();
  }
}
