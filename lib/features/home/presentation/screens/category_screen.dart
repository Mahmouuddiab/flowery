import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flower_app/features/home/presentation/cubit/home_states.dart';
import 'package:flower_app/features/home/presentation/screens/product_details.dart';
import 'package:flower_app/features/home/presentation/widgets/category_tab.dart';
import 'package:flower_app/features/home/presentation/widgets/custom_row_text.dart';
import 'package:flower_app/features/home/presentation/widgets/product_grid_item.dart';
import 'package:flower_app/shared/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;

  HomeCubit homeCubit = getIt<HomeCubit>();

  // TextEditingController searchController = TextEditingController();
  //
  // List filteredProducts = [];

  @override
  void initState() {
    super.initState();
    homeCubit.getHomeData();
  }

  // void searchProduct(String query, List products) {
  //     final results = products.where((product) {
  //     final title = product.title.toLowerCase();
  //     final input = query.toLowerCase();
  //     return title.contains(input);
  //   }).toList();
  //
  //   setState(() {
  //     filteredProducts = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      bloc: homeCubit,
      builder: (context, state) {
        if(state is HomeLoading){
          return CustomLoader();
        }
        if(state is HomeLoaded){
          // // if(filteredProducts.isEmpty && searchController.text.isEmpty){
          // //   filteredProducts = state.products;
          // }
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Gap(20),
                      CategoryTabs(
                        selectedIndex: selectedIndex,
                        category: state.categories,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                            // searchController.clear();
                            // filteredProducts = [];
                          });

                          final selectedCategory =
                          state.categories[index];

                          homeCubit.getProductsByCategory(
                              selectedCategory.id);
                        },
                      ),
                      Gap(20),
                      // CustomTextField(
                      //     label: AppStrings.search,
                      //     controller: searchController,
                      //     obscureText: false,
                      //   suffixIcon: Icon(Icons.search),
                      //   onChanged: (value) {
                      //     // searchProduct(value, state.products);
                      //   },
                      // ),
                      Gap(25),
                      CustomRowText(textOne: "Products", textTwo: "view all"),
                      Gap(20),
                      Expanded(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              var product = state.products[index];
                              return ProductGridItem(
                                  product: product,
                                onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product),));
                                },
                              ) ;
                            },
                          )
                      )
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
