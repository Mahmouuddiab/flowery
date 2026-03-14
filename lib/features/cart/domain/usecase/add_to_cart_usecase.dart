import 'package:flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:flower_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call(CartEntity cart) {
    return repository.addToCart(
      cart.productId,
      cart.quantity,
    );
  }
}