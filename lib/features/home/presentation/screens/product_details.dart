import 'package:flower_app/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final PageController _pageController = PageController();
  int currentIndex = 0;

  late List<String> images;

  @override
  void initState() {
    super.initState();
    images = widget.product.images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// IMAGE SECTION
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),

                /// BACK BUTTON
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                /// DOT INDICATOR
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                          (index) => Container(
                        margin: const EdgeInsets.all(4),
                        width: currentIndex == index ? 10 : 8,
                        height: currentIndex == index ? 10 : 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.pink
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          const SizedBox(height: 10),

          /// DETAILS SECTION
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration:  BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// PRICE + STOCK
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SAR ${widget.product.price}",
                          style:  Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Status: 1135 in stock",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),

                    const SizedBox(height: 5),

                     Text(
                      "All prices include tax",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(height: 10),

                    /// PRODUCT NAME
                    Text(
                      widget.product.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(height: 20),

                    /// DESCRIPTION TITLE
                     Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(height: 10),

                    /// DESCRIPTION
                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}