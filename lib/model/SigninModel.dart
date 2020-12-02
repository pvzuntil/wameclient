class SignInReq {
  String email;
  String password;
  String name;

  SignInReq({this.email, this.password, this.name});

  SignInReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    return data;
  }
}


class SigninRes {
  int status;
  String message;
  Data data;

  SigninRes({this.status, this.message, this.data});

  SigninRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  User user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String createdAt;
  String sId;
  String name;
  String email;
  String password;
  int iV;

  User(
      {this.createdAt,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}
