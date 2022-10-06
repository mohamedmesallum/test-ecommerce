class Oredrs {
  String? massege;
  List<Data>? data;
  List<Data>? receive;
  List<Data>? rejected;

  Oredrs({this.massege, this.data, this.receive, this.rejected});

  Oredrs.fromJson(Map<String, dynamic> json) {
    massege = json['Massege'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['receive'] != null) {
      receive = <Data>[];
      json['receive'].forEach((v) {
        receive!.add(new Data.fromJson(v));
      });
    }
    if (json['rejected'] != null) {
      rejected = <Data>[];
      json['rejected'].forEach((v) {
        rejected!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Massege'] = this.massege;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.receive != null) {
      data['receive'] = this.receive!.map((v) => v.toJson()).toList();
    }
    if (this.rejected != null) {
      data['rejected'] = this.rejected!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? Massege;
  int? orderNumber;
  int? idUser;
  int? totalpriec;
  String? timee;
  int? idAddres;
  int? approval;

  Data(
      {this.Massege,
        this.orderNumber,
        this.idUser,
        this.totalpriec,
        this.timee,
        this.idAddres,
        this.approval});

  Data.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    idUser = json['id_user'];
    totalpriec = json['totalpriec'];
    timee = json['timee'];
    idAddres = json['id_addres'];
    approval = json['approval'];
    Massege = json['Massege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_number'] = this.orderNumber;
    data['id_user'] = this.idUser;
    data['totalpriec'] = this.totalpriec;
    data['timee'] = this.timee;
    data['id_addres'] = this.idAddres;
    data['approval'] = this.approval;
    data['Massege'] = this.Massege;
    return data;
  }
}