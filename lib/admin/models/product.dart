import 'dart:convert';
import 'dart:developer';

class Product {
  String? id;
  String? catId;
  String? imageUrl;
  String? name;
  String? description;
  String? price;
  bool isLike;
  bool isSopping = false;
  int number;
  int discount;
  Product({
    this.id,
    this.catId,
    this.imageUrl,
    this.name,
    this.description,
    this.price,
    this.isSopping = false,
    this.number = 1,
    this.discount = 0,
    this.isLike = false,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (catId != null) {
      result.addAll({'catId': catId});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (price != null) {
      result.addAll({'price': price});
    }
    result.addAll({'isLike': isLike});
    result.addAll({'isSopping': isSopping});
    result.addAll({'number': number});
    result.addAll({'discount': discount});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      catId: map['catId'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      isLike: map['isLike'] ?? false,
      isSopping: map['isSopping'] ?? false,
      number: map['number']?.toInt() ?? 1,
      discount: map['discount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
