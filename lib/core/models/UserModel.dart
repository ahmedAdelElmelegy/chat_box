class UserModel {
  final String? email;
  final String? uid;
  final String? phone;
  final String? name;
  final String? bio;
  UserModel({this.email, this.uid, this.phone, this.name, this.bio});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        phone: json['phone'],
        name: json['name'],
        uid: json['uid'],
        bio: json['bio']);
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'uid': uid,
      'bio': bio
    };
  }
}
