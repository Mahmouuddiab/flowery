import 'package:flower_app/core/cache/cache_helper.dart';
import 'package:flower_app/features/cart/data/data_source/cart_remote_ds.dart';
import 'package:flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';
import 'package:flower_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDs cartRemoteDs;

  CartRepositoryImpl(this.cartRemoteDs);

  @override
  Future<CartEntity> addToCart(String productId, int quantity) async {
    final token = await CacheHelper.getToken();
    if (token == null) throw Exception("Token not found");
    return await cartRemoteDs.addToCart(token, productId, quantity);
  }

  @override
  Future<UserCartEntity> getCart() async {
    final token = await CacheHelper.getToken();
    if (token == null) throw Exception("Token not found");
    return await cartRemoteDs.getCart(token);
  }

  @override
  Future<void> deleteFromCart(String id) async{
    final token = await CacheHelper.getToken();
    if (token == null) throw Exception("Token not found");
    return await cartRemoteDs.deleteCartItem(token, id) ;
  }

}