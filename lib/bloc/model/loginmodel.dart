class LoginModel {
  bool? status;
  String? msg;
  String? token;
  String? id;

  LoginModel({this.status, this.msg, this.token, this.id});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}