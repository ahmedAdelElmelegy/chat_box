class UserModel {
  final String? email;
  final String? uid;
  final String? phone;
  final String? name;
  final String? bio;
  final String? image;
  UserModel(
      {this.email, this.uid, this.phone, this.name, this.bio, this.image});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        phone: json['phone'],
        name: json['name'],
        uid: json['uid'],
        bio: json['bio'],
        image: json['image']);
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'uid': uid,
      'bio': bio,
      'image': image,
    };
  }
}
