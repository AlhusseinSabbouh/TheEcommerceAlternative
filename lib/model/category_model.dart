class CategoryModel {
  String _name;
  String _image;

  String get name => _name;
  String get image => _image;

  CategoryModel({required image, required name})
      : this._image = name,
        this._name = image;

  CategoryModel.fromJson(Map<String, dynamic> map)
      : this._image = map['image'],
        this._name = map['name'];

  Map<String, dynamic> toJson() {
    return {'name': this._name, 'image': this._image};
  }
}
