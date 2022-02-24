class ProductModel {
  String name, desc, price, size, color, image;

  ProductModel(
      {required this.name,
      required this.color,
      required this.desc,
      required this.image,
      required this.price,
      required this.size});

  ProductModel.fromJson(Map<String, dynamic> map)
      : this.color = map['color'],
        this.desc = map['desc'],
        this.image = map['image'],
        this.name = map['name'],
        this.price = map['price'],
        this.size = map['size'];

  Map<String, dynamic> toJson() {
    return {
      'color': this.color,
      'desc': this.desc,
      'image': this.image,
      'name': this.name,
      'price': this.price,
      'size': this.size
    };
  }
}
