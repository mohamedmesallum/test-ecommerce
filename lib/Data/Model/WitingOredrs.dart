class orderswaiting {
  String? massege;
  List<DataORD>? data;

  orderswaiting({this.massege, this.data});

  orderswaiting.fromJson(Map<String, dynamic> json) {
    massege = json['Massege'];
    if (json['data'] != null) {
      data = <DataORD>[];
      json['data'].forEach((v) {
        data!.add(new DataORD.fromJson(v));
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

class DataORD {

  int? orderNumberdata;
  int? idProducts;
  int? cont;
  int? priecprodect;
  String? name;
  String? image;
  int?approval;

  DataORD(
      {
        this.orderNumberdata,
        this.idProducts,
        this.cont,
        this.priecprodect,
        this.name,
        this.image,
      this.approval,
      });

  DataORD.fromJson(Map<String, dynamic> json) {
    orderNumberdata = json['order_numberdata'];
    idProducts = json['id_products'];
    cont = json['cont'];
    priecprodect = json['priecprodect'];
    name = json['name'];
    image = json['image'];
    approval = json['approval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_numberdata'] = this.orderNumberdata;
    data['id_products'] = this.idProducts;
    data['cont'] = this.cont;
    data['priecprodect'] = this.priecprodect;
    data['name'] = this.name;
    data['image'] = this.image;
    data['approval'] = this.approval;
    return data;
  }
}



