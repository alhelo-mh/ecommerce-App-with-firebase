import 'package:firebase_auth/firebase_auth.dart';

import '../ap_router/app_router.dart';

class AuthHelper {
  AuthHelper._x();
  static AuthHelper authHelper = AuthHelper._x();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppRouter.showCustomDiaoug('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppRouter.showCustomDiaoug('Wrong password provided for that user.');
      } else {
        AppRouter.showCustomDiaoug(e.toString());
      }

    }
  }

  Future<bool> register(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //AppRouter.showCustomDiaoug('the account has been created successfully');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppRouter.showCustomDiaoug('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppRouter.showCustomDiaoug(
            'The account already exists for that email.');
      }
      return false;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  singnout() async {
    await firebaseAuth.signOut();
  }

  User? checkUser() {
    return firebaseAuth.currentUser;
  }
}
