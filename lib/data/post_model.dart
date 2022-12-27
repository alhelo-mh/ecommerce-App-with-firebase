class PostModel {
  String details;
  double palnc;
  double palncOld;
  double delivery;
  String featuredImage;
  bool isLike;
  bool isSopping;
  bool iscomplet = false;
  dynamic discount;
  bool dresses;
  bool tops;
  bool sweaters;
  bool jeans;
  int number = 1;
  String image;
  String nameCatalogue;
  PostModel(
      {required this.details,
      required this.palnc,
      required this.palncOld,
      required this.delivery,
      required this.featuredImage,
      required this.discount,
      required this.isLike,
      required this.isSopping,
      required this.dresses,
      required this.tops,
      required this.sweaters,
      required this.jeans,
      required this.image,
      required this.nameCatalogue});
}

class AppUser {
  String? id;
  String? email;
  String? fname;
  String? lname;
  String? phoneNumber;
  String? imageUrl;
  String? location;
  bool isAdmin=false;
  //bool? isMale;
  AppUser(
      [this.id,
      this.email,
      this.fname,
      this.lname,
      this.phoneNumber,
      this.isAdmin=false,
      this.location,
      this.imageUrl]);
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fname': fname,
      'lname': lname,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'location': location,
      'imageUrl': imageUrl,
    };
  }

  AppUser.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    fname = map['fname'];
    lname = map['lname'];
    phoneNumber = map['phoneNumber'];
    isAdmin = map['isAdmin'];
    imageUrl = map['imageUrl'];
    location = map['location'];
  }
}
