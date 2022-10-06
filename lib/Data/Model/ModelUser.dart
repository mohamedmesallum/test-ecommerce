class DataUser {
  String? massege;
  Data? data;

  DataUser({this.massege, this.data});

  DataUser.fromJson(Map<String, dynamic> json) {
    massege = json['Massege'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Massege'] = this.massege;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? username;
  String? email;
  String? passwerd;
  int? verfiycode;
  int? approve;
  String? phone;
  String? creationTime;

  Data(
      {this.id,
        this.username,
        this.email,
        this.passwerd,
        this.verfiycode,
        this.approve,
        this.phone,
        this.creationTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    passwerd = json['passwerd'];
    verfiycode = json['verfiycode'];
    approve = json['approve'];
    phone = json['phone'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['passwerd'] = this.passwerd;
    data['verfiycode'] = this.verfiycode;
    data['approve'] = this.approve;
    data['phone'] = this.phone;
    data['creationTime'] = this.creationTime;
    return data;
  }
}