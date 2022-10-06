class Address {
  String? massege;
  List<Data>? data;

  Address({this.massege, this.data});

  Address.fromJson(Map<String, dynamic> json) {
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
  int? idUser;
  String? region;
  String? street;
  String? building;
  int? turn;
  int? apartme;
  String? specialMarque;
  String? nstructions;
  int? id;

  Data(
      {this.idUser,
        this.region,
        this.street,
        this.building,
        this.turn,
        this.apartme,
        this.specialMarque,
        this.nstructions,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    region = json['Region'];
    street = json['Street'];
    building = json['Building'];
    turn = json['turn'];
    apartme = json['Apartme'];
    specialMarque = json['special_marque'];
    nstructions = json['nstructions'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['Region'] = this.region;
    data['Street'] = this.street;
    data['Building'] = this.building;
    data['turn'] = this.turn;
    data['Apartme'] = this.apartme;
    data['special_marque'] = this.specialMarque;
    data['nstructions'] = this.nstructions;
    data['id'] = this.id;
    return data;
  }
}