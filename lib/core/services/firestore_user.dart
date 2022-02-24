import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class FireStoreUser {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("User");

  Future<void> addUserToFireStore(UserModel userModel) async {
    print("heeere1");
    await _collectionReference.doc(userModel.userId).set(userModel.toJson());
    print("heere2");
    print(userModel.toJson());
  }
}
