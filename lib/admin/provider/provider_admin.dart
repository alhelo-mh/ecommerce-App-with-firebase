import 'dart:developer';
import 'dart:io';

import 'package:final_project/admin/models/product.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/data/post_model.dart';
import 'package:final_project/helpers/firestore_helper.dart';
import 'package:final_project/helpers/storage_helpers.dart';
import 'package:final_project/providers/auth_provider.dart';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';

class ProviderAdmin extends ChangeNotifier {
  ProviderAdmin() {
    getAllCategorys();
    // getAllFavoriteProduct();
    //getAllCartProduct();
  }

  TextEditingController catContorllerName = TextEditingController();
  File? pickedImage;
  List<Category>? categories;
  List<Product>? products;
  List<Product>? carts;
  List<Product>? favorite;

  pickCategoryImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      pickedImage = File(xFile.path);
    }
  }

  createnNewCategory() async {
    if (pickedImage != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadImage("categories_images", pickedImage!);
      Category category =
          Category(image: imageUrl, name: catContorllerName.text);
      String id =
          await FirestoreHelper.firestoreHelper.createNewCategory(category);
      category.id = id;
      categories!.add(category);
      pickedImage = null;
      catContorllerName.clear();
      notifyListeners();
      AppRouter.hideLoadingDialoug();
      AppRouter.showCustomDiaoug('Successflly');
    }
  }

  getSearch() async {
    await FirestoreHelper.firestoreHelper.getSearch();
    notifyListeners();
  }

  getAllCategorys() async {
    categories = await FirestoreHelper.firestoreHelper.getAllCategory();
    notifyListeners();
  }

  delelteCategory(Category category) async {
    await FirestoreHelper.firestoreHelper.deleteCategory(category.id!);
    categories!.remove(category);
    notifyListeners();
  }

  TextEditingController productNameContoller = TextEditingController();
  TextEditingController productdesContoller = TextEditingController();
  TextEditingController productpricContoller = TextEditingController();
  TextEditingController productdiscountContoller = TextEditingController();

  addNewProduct(String catId) async {
    if (pickedImage != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadImage("Products_images", pickedImage!);
      Product product = Product(
        imageUrl: imageUrl,
        name: productNameContoller.text,
        description: productdesContoller.text,
        price: productpricContoller.text,
        discount: productdiscountContoller.hashCode,
        isLike: false,
        catId: catId,
      );
      String id = await FirestoreHelper.firestoreHelper.addNewProduct(product);
      product.id = id;
      products!.add(product);
      pickedImage = null;
      productNameContoller.clear();
      productdesContoller.clear();
      productpricContoller.clear();
      productdiscountContoller.clear();

      notifyListeners();
      AppRouter.hideLoadingDialoug();
      AppRouter.showCustomDiaoug('Successflly');
    }
  }

  getAllProduct(String catId) async {
    // AppRouter.showLoaderDialog();
    products = await FirestoreHelper.firestoreHelper.getAllProduct(catId);
    notifyListeners();
    // AppRouter.hideLoadingDialoug();
  }

  addCartProduct(Product product, AppUser appUser) async {
    await FirestoreHelper.firestoreHelper.addCartProduct(appUser, product);
    // appUser.id = product.id;
    carts!.add(product);
    notifyListeners();
    //AppRouter.hideLoadingDialoug();
    AppRouter.showCustomDiaoug('Successflly');
  }

  getAllCartProduct(AppUser appUser) async {
    try {
      // AppRouter.showLoaderDialog();
      carts = await FirestoreHelper.firestoreHelper.getAllCartProduct(appUser);
      // log(carts!.length.toString());
      notifyListeners();
      // AppRouter.hideLoadingDialoug();
    } catch (e) {
      log("e :$e");
    }
  }

  addFavoriteProduct(Product product, AppUser appUser) async {
    await FirestoreHelper.firestoreHelper.addFavoriteProduct(appUser, product);
    favorite!.add(product);
    notifyListeners();
    //  AppRouter.hideLoadingDialoug();
    AppRouter.showCustomDiaoug('Successflly');
  }

  getAllFavoriteProduct(AppUser appUser) async {
    // AppRouter.showLoaderDialog();
    favorite =
        await FirestoreHelper.firestoreHelper.getAllFavoriteProduct(appUser);
    // log(carts!.length.toString());
    notifyListeners();
    // AppRouter.hideLoadingDialoug();
  }

  delelteProduct(Product product) async {
    await FirestoreHelper.firestoreHelper.deleteProduct(product.id!);
    products!.remove(product);
    notifyListeners();
  }

  delelteCartProduct(AppUser appUser, Product product) async {
    await FirestoreHelper.firestoreHelper.deleteCartProduct(appUser, product);
    carts!.remove(product);
    log(carts!.length.toString());
    notifyListeners();
    AppRouter.hideLoadingDialoug();
    AppRouter.showCustomDiaoug('Successflly');
  }

  delelteFavoriteProduct(Product product, AppUser appUser) async {
    await FirestoreHelper.firestoreHelper
        .deletefavoriteProduct(appUser, product);
    favorite!.remove(product);
    notifyListeners();
    AppRouter.showCustomDiaoug('Successflly');
  }

  updateModel(Product product, AppUser appUser) {
    //bool isLikeProduct = false;
    if (!product.isLike) {
      product.isLike = !product.isLike;
      addFavoriteProduct(product, appUser);
      getAllFavoriteProduct(appUser);
    } else if (product.isLike) {
      product.isLike = !product.isLike;
      delelteCartProduct(appUser, product);
      getAllFavoriteProduct(appUser);
    }

    notifyListeners();
  }

  List list = [];
  updateModelSopping(Product product) {
    product.isSopping = !product.isSopping;
    carts!.where((element) => element.isSopping).toList();
    notifyListeners();
  }

  addNumCart(Product product) {
    product.number++;
    notifyListeners();
  }

  minsNumCart(Product product) {
    product.number--;
    notifyListeners();
  }

  // int sum =
  //     carts!.map((e) => e.number).reduce((value, element) => value + element);
  sumTotalPrice() {
    var sum = carts!
        .map((e) => double.parse(e.price.toString()))
        .reduce((value, element) => (value + element));
    var sum2 = carts!
        .map((e) => double.parse(e.number.toString()))
        .reduce((value, element) => (value + element));
    var x = sum * sum2;
    //log("Sum:${sum.toString()}");
    return x.toString();
  }

  sumTotalOrder() {
    var sum = carts!
        .map((e) => double.parse(e.price.toString()))
        .reduce((value, element) => (value + element));
    var sum2 = carts!
        .map((e) => double.parse(e.number.toString()))
        .reduce((value, element) => (value + element));
    var x = (sum * sum2) + 15;
    //log("Sum:${sum.toString()}");
    return x.toString();
  }
}
