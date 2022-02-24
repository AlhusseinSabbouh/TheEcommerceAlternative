

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';
import '../../view/home pages/home_view.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  User? _use;
  Rxn<User> _user = Rxn<User>();
  GetStorage token = GetStorage();
  String email = "", password = "", name = "";
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  googleSignInMethod() async {
    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      print(_googleUser);
      GoogleSignInAuthentication googleAuth = await _googleUser!.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await _firebaseAuth.signInWithCredential(credential).then((user) async {
        saveUser(user);
      });
      token.write("email", "true");
      Get.to(HomeView());
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPasswordMethod() async {
    try {
      print("password is " + password);
      print("email is " + email);

      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      token.write("email", "true");
      Get.offAll(HomeView());
    } catch (e) {
      print(e.toString());
      print(e);
      // Get.snackbar("Error Login Accoun", msg,
      //     snackPosition: SnackPosition.BOTTOM);
    }
  }

  createAccountWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      token.write("email", "true");
      Get.offAll(HomeView());
    } catch (e) {
      print(e.toString());
      print(e);
      // Get.snackbar("Error Login Accoun", msg,
      //     snackPosition: SnackPosition.BOTTOM);
    }
  }

  saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      email: user.user!.email,
      pic: "",
      userId: user.user!.uid,
      name: user.user!.displayName == null ? name : user.user!.displayName,
    );

    await FireStoreUser().addUserToFireStore(userModel);
  }
}
