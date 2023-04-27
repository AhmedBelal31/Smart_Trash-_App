class LoginModel {
  bool? status;

  String? message;

  LoginDataModel? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    this.data =
        json['data'] != null ? LoginDataModel.fromJson(json['data']) : null;
  }
}

class LoginDataModel {
  int? id;

  String? name;

  String? email;
  String? phone;
  String? image;
  String? token;

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.image = json['image'];
    this.token = json['token'];
  }
}
