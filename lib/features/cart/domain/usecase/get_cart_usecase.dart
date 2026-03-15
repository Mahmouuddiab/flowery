import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';
import 'package:flower_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  /// Call this to get the user cart
  Future<UserCartEntity> call() async {
    return await repository.getCart();
  }
}