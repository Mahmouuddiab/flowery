import 'package:flower_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromCartUseCase {
  CartRepository cartRepository;
  DeleteFromCartUseCase(this.cartRepository);
  Future<void> call(String id)=> cartRepository.deleteFromCart(id);
}