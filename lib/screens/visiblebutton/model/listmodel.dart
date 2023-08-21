class ListModel {
  int id;
  String title;
  String detail;
  bool value;

  ListModel({required this.id, required this.title,required this.detail, required this.value});

  ListModel copyWith({
    int? id,
    String? title,
    String? detail,
    bool? value,
  }) {
    return ListModel(
      id: id ?? this.id,
      title: title ?? this.title,
      detail: detail ?? this.detail,
      value: value ?? this.value,
    );
  }
}