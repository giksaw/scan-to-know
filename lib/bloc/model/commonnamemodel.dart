class CommonNameModel {
  bool? status;
  String? msg;
  List<String>? data;

  CommonNameModel({this.status, this.msg, this.data});

  CommonNameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
