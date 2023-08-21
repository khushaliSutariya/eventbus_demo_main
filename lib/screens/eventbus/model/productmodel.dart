class ProductModel {
  String id;
  String title;
  String detail;
  bool isFavorite;

  ProductModel({required this.id, required this.title,required this.detail, required this.isFavorite});

  ProductModel copyWith({
    String? id,
    String? title,
    String? detail,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      detail: detail ?? this.detail,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}