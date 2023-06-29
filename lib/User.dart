class User {
  int id;
  String name;
  String username;
  String phone;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;

  User(
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  );

  User.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
    name = json['name'],
    username = json['username'],
    phone = json['phone'],
    email = json['email'],
    emailVerifiedAt = json['email_verified_at'],
    createdAt = json['created_at'],
    updatedAt = json['updated_at'];
  

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    return {
      'id': id,
      'name': name,
      'username': username,
      'phone': phone,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    // data['id'] = this.id;
    // data['name'] = this.name;
    // data['username'] = this.username;
    // data['phone'] = this.phone;
    // data['email'] = this.email;
    // data['email_verified_at'] = this.emailVerifiedAt;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // return data;
  }
}
