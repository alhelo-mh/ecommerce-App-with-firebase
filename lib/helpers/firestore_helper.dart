import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/models/product.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/data/post_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  creatNewUser(AppUser appUser) async {
    //firestore.collection('users').add(appUser.toMap());
    //id غير عشوائي
    firestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFirestor(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = document.data();
    AppUser appUser = AppUser.fromMap(data!);
    return appUser;
  }

  updataUsernfo(AppUser appUser) {
    firestore.collection('users').doc(appUser.id).update(appUser.toMap());
  }

  ///////Admin
  createNewCategory(Category category) async {
    DocumentReference<Map<String, dynamic>> document =
        await firestore.collection('categories').add(category.toMap());
    return document.id;
  }

  Future<List<Category>> getAllCategory() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('categories').get();
    List<Category> category = querySnapshot.docs.map((e) {
      Category cat = Category.formMap(e.data());
      cat.id = e.id;
      return cat;
    }).toList();
    // log(category.length.toString());
    return category;
  }

  deleteCategory(String id) async {
    await firestore.collection('categories').doc(id).delete();
  }

  updateCategory(Category newCategory) async {}

  Future<String> addNewProduct(Product product) async {
    DocumentReference<Map<String, dynamic>> querySnapshot = await firestore
        .collection('categories')
        .doc(product.catId)
        .collection('products')
        .add(product.toMap());
    return querySnapshot.id;
  }

//search delegate
  Future<List<Product>?> getAllProduct(String catId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('categories')
          .doc(catId)
          .collection('products')
          .get();
      return querySnapshot.docs.map((e) {
        Product product = Product.fromMap(e.data());
        product.id = catId;
        return product;
      }).toList();
    } on Exception catch (e) {
      // print(e.toString());
    }
  }

  deleteProduct(String id) async {
    await firestore
        .collection('categories')
        .doc(id)
        .collection('products')
        .doc(id)
        .delete()
        .then((value) => log('message'));
  }

  // deleteNestedSubcollections(String id) {
  //   Future<QuerySnapshot> books =
  //       collection('').document(id).collection("Books").getDocuments();
  //   books.then((value) {
  //     value.documents.forEach((element) {
  //           collection("Books").
  //           .document(id)
  //           .collection("Books")
  //           .document(element.documentID)
  //           .delete()
  //           .then((value) => print("success"));
  //     });
  //   });
  // }
  getSearch() async {
    firestore
        .collection("categories")
        .where('name', isGreaterThanOrEqualTo: DateTime.now())
        .get();
  }

  addCartProduct(AppUser appUser, Product product) async {
    await firestore
        .collection('users')
        .doc(appUser.id)
        .collection('catrs')
        .doc(product.id)
        .set(product.toMap());

    log('message');
    AppRouter.hideLoadingDialoug();
  }

  Future<List<Product>?> getAllCartProduct(AppUser appUser) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('users')
        .doc(appUser.id)
        .collection('catrs')
        .get();

    List<Product> cartProduct = querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());

      return product;
    }).toList();
    return cartProduct;
  }

  deleteCartProduct(AppUser appUser, Product product) async {
    try {
      await firestore
          .collection('users')
          .doc(appUser.id)
          .collection('catrs')
          .doc(product.id)
          .delete()
          .then((value) {
        log('id ');
      });
     
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  addFavoriteProduct(AppUser appUser, Product product) async {
    await firestore
        .collection('users')
        .doc(appUser.id)
        .collection('favorite')
        .doc(product.id)
        .set(product.toMap());
  }

  Future<List<Product>?> getAllFavoriteProduct(AppUser appUser) async {
    //log("catId : $catId");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('users')
        .doc(appUser.id)
        .collection('favorite')
        .get();

    List<Product> cartProduct = querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      return product;
    }).toList();
    return cartProduct;
  }

  deletefavoriteProduct(AppUser appUser, Product product) async {
    await firestore
        .collection('users')
        .doc(appUser.id)
        .collection('favorite')
        .doc(product.id)
        .delete();
    //  log('product');
  }
}
