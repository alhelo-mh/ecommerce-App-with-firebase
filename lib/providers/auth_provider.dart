import 'dart:io';

import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/views/add_new_category.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/data/post_model.dart';
import 'package:final_project/helpers/firestore_helper.dart';
import 'package:final_project/helpers/storage_helpers.dart';
import 'package:final_project/screens/layout_home.dart';
import 'package:final_project/screens/logins/login.dart';
import 'package:final_project/screens/logins/regstar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/auth_hhelper.dart';

class AuthProvider extends ChangeNotifier {
  bool isColor = true;
  AuthProvider() {
    checkUser();
  }
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController regsterEmailController = TextEditingController();
  TextEditingController loginPassWordController = TextEditingController();
  TextEditingController regsterPassWordController = TextEditingController();
  TextEditingController regsterfnameController = TextEditingController();
  TextEditingController regsterlnameController = TextEditingController();
  TextEditingController regsterphoneController = TextEditingController();
  TextEditingController regsterlocationController = TextEditingController();
  TextEditingController regsterIsAdminController = TextEditingController();
  TextEditingController profileControllerfName = TextEditingController();
  TextEditingController profileControllerlName = TextEditingController();
  TextEditingController profileControllerphone = TextEditingController();
  TextEditingController profileControllerEmail = TextEditingController();
  TextEditingController profileControllerlocation = TextEditingController();

  AppUser? loggedAppUser;
  late User loggedUser;
  login() async {
    String? userId = await AuthHelper.authHelper
        .login(loginEmailController.text.trim(), loginPassWordController.text);
    if (userId != null) {
      getUserFromFirestor(userId);
      AppRouter.navigateAndReplace(LayoutHome());
    }
  }

  getUserFromFirestor(String id) async {
    loggedAppUser =
        await FirestoreHelper.firestoreHelper.getUserFromFirestor(id);
    loggedAppUser!.id = id;
    profileControllerfName.text = loggedAppUser!.fname ?? '';
    profileControllerlName.text = loggedAppUser!.lname ?? '';
    profileControllerlocation.text = loggedAppUser!.location ?? '';
    profileControllerphone.text = loggedAppUser!.phoneNumber ?? '';
    profileControllerEmail.text = loggedAppUser!.email ?? '';

    notifyListeners();
  }

  register() async {
    bool isSucces = await AuthHelper.authHelper.register(
        regsterEmailController.text.trim(), regsterPassWordController.text);
    if (isSucces) {
      getUserFromAuth();
      AppUser appUser = AppUser(
        loggedUser.uid,
        loggedUser.email,
        regsterfnameController.text,
        regsterlnameController.text,
        regsterphoneController.text,
        regsterIsAdminController.hasListeners,
        regsterlocationController.text,
      );
      FirestoreHelper.firestoreHelper.creatNewUser(appUser);
      AppRouter.navigateAndReplace(LoginScreen());
    }
  }

  getUserFromAuth() {
    loggedUser = AuthHelper.authHelper.checkUser()!;
  }

  checkUser() async {
    await Future.delayed(const Duration(seconds: 5));
    User? user = AuthHelper.authHelper.checkUser();
    if (user == null) {
      AppRouter.navigateAndReplace(RegstarScreen());
    } else {
      getUserFromFirestor(user.uid);
      AppRouter.navigateAndReplace(LayoutHome());
    }
  }

  signOut() async {
    AuthHelper.authHelper.singnout();
    AppRouter.navigateAndReplace(LoginScreen());
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changrPasswordSuffix() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

  changeColorMood() {
    isColor ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  updataImage() async {
    
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage('profile_images', file);
      loggedAppUser!.imageUrl = imageUrl;

      await FirestoreHelper.firestoreHelper.updataUsernfo(loggedAppUser!);
      // loggedAppUser!.imageUrl = imageUrl;
      // notifyListeners();
      getUserFromFirestor(loggedAppUser!.id!);
    }
  }

  UpdateUserInfo() async {
    loggedAppUser!.fname = profileControllerfName.text;
    loggedAppUser!.lname = profileControllerlName.text;
    loggedAppUser!.phoneNumber = profileControllerphone.text;
    loggedAppUser!.location = profileControllerlocation.text;
    FirestoreHelper.firestoreHelper.updataUsernfo(loggedAppUser!);
    getUserFromFirestor(loggedAppUser!.id!);
  }

  ///////admin

}
