class ProductEntity {
  final String id;
  final String title;
  final String imgCover;
  final num price;
  final num priceAfterDiscount;
  final String category;
  final List<String> images;

  ProductEntity({
    required this.id,
    required this.title,
    required this.imgCover,
    required this.price,
    required this.priceAfterDiscount,
    required this.category,
    required this.images
});
}