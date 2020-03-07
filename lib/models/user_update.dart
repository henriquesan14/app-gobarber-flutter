class UserUpdate {
  String name;
  String email;
  String oldPassword;
  String password;
  String confirmPassword;

  UserUpdate({this.name, this.email, this.oldPassword, this.password, this.confirmPassword});

  UserUpdate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    oldPassword = json['oldPassword'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['oldPassword'] = this.oldPassword;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
