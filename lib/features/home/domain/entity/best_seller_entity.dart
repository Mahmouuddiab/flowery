class BestSellerEntity {
  final String id;
  final String title;
  final num price;
  final String? imgCover;

  BestSellerEntity({
    required this.id,
    required this.title,
    required this.price,
    this.imgCover,
  });
}