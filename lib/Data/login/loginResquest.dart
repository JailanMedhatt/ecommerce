/// email : "jailan@yahoo.com"
/// password : "12345"

class LoginResquest {
  LoginResquest({
      this.email, 
      this.password,});

  LoginResquest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}