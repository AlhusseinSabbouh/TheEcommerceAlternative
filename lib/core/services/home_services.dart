import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';


class HomeServices {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('BestSellings');
  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  Future<List<CategoryModel>> fetchTheCategoryFromFirestore() async {
    await _categoryCollectionRef.get().then((category) {
      for (int i = 0; i < category.docs.length; i++) {
        _categories.add(CategoryModel.fromJson(
            category.docs[i].data() as Map<String, dynamic>));
      }
    });
    return _categories;
  }

  Future<List<ProductModel>> fetchTheProductFromFirestore() async {
    await _productCollectionRef.get().then((product) {
      for (int i = 0; i < product.docs.length; i++) {
        _products.add(ProductModel.fromJson(
            product.docs[i].data() as Map<String, dynamic>));
      }
    });
    return _products;
  }
}
