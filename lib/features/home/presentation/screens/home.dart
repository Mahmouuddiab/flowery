import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flower_app/features/home/presentation/cubit/home_states.dart';
import 'package:flower_app/features/home/presentation/widgets/best_seller_item.dart';
import 'package:flower_app/features/home/presentation/widgets/category_item.dart';
import 'package:flower_app/features/home/presentation/widgets/custom_row_text.dart';
import 'package:flower_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flower_app/features/home/presentation/widgets/occasion_item.dart';
import 'package:flower_app/shared/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  HomeCubit homeCubit = getIt<HomeCubit>();
  @override
  void initState() {
    super.initState();
    homeCubit.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
        bloc: homeCubit,
        builder: (context, state) {
          if(state is HomeLoading){
            return CustomLoader();
          }
          if(state is HomeLoaded){
            return GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView(
                      children: [
                        HomeAppBar(controller: searchController),
                        Gap(40),
                        CustomRowText(textOne: "Categories", textTwo: "view all"),
                        Gap(25),
                        SizedBox(
                          height: 130,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories.length,
                              separatorBuilder: (context, index) => Gap(10),
                              itemBuilder: (context, index) {
                              var category = state.categories[index];
                                return CategoryItem(category: category) ;
                              },
                          ),
                        ),
                        Gap(25),
                        CustomRowText(textOne: "Best Sellers", textTwo: "view all"),
                        Gap(25),
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.bestSellers.length,
                            separatorBuilder: (context, index) => Gap(10),
                            itemBuilder: (context, index) {
                              var bestSeller = state.bestSellers[index];
                              return  BestSellerItem(bestSellerEntity: bestSeller) ;
                            },
                          ),
                        ),
                        Gap(25),
                        CustomRowText(textOne: "Occasions", textTwo: "view all"),
                        Gap(25),
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.occasions.length,
                            separatorBuilder: (context, index) => Gap(10),
                            itemBuilder: (context, index) {
                              var occasion = state.occasions[index];
                              return  OccasionItem(occasionEntity: occasion) ;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ) ;
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
    );
  }
}
