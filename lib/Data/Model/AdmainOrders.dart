class AdmainOrders {
  String? massege;
  List<Data>? data;

  AdmainOrders({this.massege, this.data});

  AdmainOrders.fromJson(Map<String, dynamic> json) {
    massege = json['Massege'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Massege'] = this.massege;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? orderNumber;
  int? idUser;
  int? totalpriec;
  String? timee;
  int? idAddres;
  int? approval;
  String? region;
  String? street;
  String? building;
  int? turn;
  int? apartme;
  String? specialMarque;
  String? nstructions;
  int? id;
  String? username;
  String? email;
  String? phone;

  Data(
      {this.orderNumber,
        this.idUser,
        this.totalpriec,
        this.timee,
        this.idAddres,
        this.approval,
        this.region,
        this.street,
        this.building,
        this.turn,
        this.apartme,
        this.specialMarque,
        this.nstructions,
        this.id,
        this.username,
        this.email,
        this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    idUser = json['id_user'];
    totalpriec = json['totalpriec'];
    timee = json['timee'];
    idAddres = json['id_addres'];
    approval = json['approval'];
    region = json['Region'];
    street = json['Street'];
    building = json['Building'];
    turn = json['turn'];
    apartme = json['Apartme'];
    specialMarque = json['special_marque'];
    nstructions = json['nstructions'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_number'] = this.orderNumber;
    data['id_user'] = this.idUser;
    data['totalpriec'] = this.totalpriec;
    data['timee'] = this.timee;
    data['id_addres'] = this.idAddres;
    data['approval'] = this.approval;
    data['Region'] = this.region;
    data['Street'] = this.street;
    data['Building'] = this.building;
    data['turn'] = this.turn;
    data['Apartme'] = this.apartme;
    data['special_marque'] = this.specialMarque;
    data['nstructions'] = this.nstructions;
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}