import 'package:flower_app/features/home/domain/usecase/best_seller_usecase.dart';
import 'package:flower_app/features/home/domain/usecase/category_usecase.dart';
import 'package:flower_app/features/home/domain/usecase/occasion_usecase.dart';
import 'package:flower_app/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  CategoryUseCase categoryUseCase;
  BestSellerUseCase bestSellerUseCase;
  OccasionUseCase occasionUseCase;
  HomeCubit(this.categoryUseCase, this.bestSellerUseCase, this.occasionUseCase)
    : super(HomeInitialState());

  Future<void> getHomeData() async {
    emit(HomeLoading());

    try {
      final categories = await categoryUseCase.call();
      print("Categories: $categories");

      final bestSellers = await bestSellerUseCase.call();
      print("Best Sellers: $bestSellers");

      final occasions = await occasionUseCase.call();
      print("Occasions: $occasions");
      emit(
        HomeLoaded(
          categories: categories,
          bestSellers: bestSellers,
          occasions: occasions,
        ),
      );
    } catch (e) {
      print("ERROR: $e");
      emit(HomeError(e.toString()));
    }
  }
}
