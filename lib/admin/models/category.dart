class Category {
  String? id;
  String? image;
  String? name;
  Category({this.image, this.name});
  toMap() {
    return {
      'image': image,
      'name': name,
    };
  }
  Category.formMap(Map<String,dynamic>map){
    image = map['image'];
    name = map['name'];

  }
}
