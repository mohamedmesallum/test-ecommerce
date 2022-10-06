class prodects {
  String? massege;
  List<Data>? data;

  prodects({this.massege, this.data});

  prodects.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? priec;
  int? oldPriec;
  int? discount;
  String? image;
  String? name;
  String? description;
  int? inFavorites;
  int? inCart;
  int? relations;
  String? color;
  String? size;
  int? sections;
  int?id_products;

  Data(
      {this.id,
        this.priec,
        this.oldPriec,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.inFavorites,
        this.inCart,
        this.relations,
        this.color,
        this.size,
      this.sections,
        this.id_products
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priec = json['priec'];
    oldPriec = json['old_priec'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    relations = json['Relations'];
    color = json['color'];
    size = json['size'];
    sections=json['sections'];
    id_products=json['id_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priec'] = this.priec;
    data['old_priec'] = this.oldPriec;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    data['Relations'] = this.relations;
    data['color'] = this.color;
    data['size'] = this.size;
    data['sections'] = this.sections;
    data['id_products'] = this.id_products;
    return data;
  }
}