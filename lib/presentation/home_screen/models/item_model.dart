import 'dart:ui';

class ItemModel {
  final String imageUrl;
  final String name;
  final Color color;
  final int availableCount;
  final int count;
  final String itemCode;
  final double price;
  final bool isLiked;

  ItemModel({
    required this.imageUrl,
    required this.name,
    required this.color,
    required this.availableCount,
    required this.count,
    required this.itemCode,
    required this.price,
    required this.isLiked,
  });

  ItemModel copyWith({
    String? imageUrl,
    String? name,
    Color? color,
    int? availableCount,
    int? count,
    String? itemCode,
    double? price,
    bool? isLiked,
  }) {
    return ItemModel(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      color: color ?? this.color,
      availableCount: availableCount ?? this.availableCount,
      count: count ?? this.count,
      itemCode: itemCode ?? this.itemCode,
      price: price ?? this.price,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
