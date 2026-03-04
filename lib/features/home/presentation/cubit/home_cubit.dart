import 'package:flower_app/features/home/domain/usecase/best_seller_usecase.dart';
import 'package:flower_app/features/home/domain/usecase/category_usecase.dart';
import 'package:flower_app/features/home/domain/usecase/occasion_usecase.dart';
import 'package:flower_app/features/home/domain/usecase/product_usecase.dart';
import 'package:flower_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final CategoryUseCase categoryUseCase;
  final BestSellerUseCase bestSellerUseCase;
  final OccasionUseCase occasionUseCase;
  final ProductUseCase productUseCase;

  HomeCubit(
      this.categoryUseCase,
      this.bestSellerUseCase,
      this.occasionUseCase,
      this.productUseCase,
      ) : super(HomeInitialState());

  // Fetch initial home data (all categories, products, etc.)
  Future<void> getHomeData() async {
    emit(HomeLoading());

    try {
      final categories = await categoryUseCase.call();
      final bestSellers = await bestSellerUseCase.call();
      final occasions = await occasionUseCase.call();

      // Fetch all products (no category filter for initial load)
      final products = await productUseCase.call(categories.first.id);

      emit(HomeLoaded(
        categories: categories,
        bestSellers: bestSellers,
        occasions: occasions,
        products: products,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> getProductsByCategory(String category) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;

      try {
        final products = await productUseCase.call(category);

        emit(HomeLoaded(
          categories: currentState.categories,
          bestSellers: currentState.bestSellers,
          occasions: currentState.occasions,
          products: products,
        ));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    }
  }

}