class modelfavorites {
  String? massege;
  List<Data>? data;

  modelfavorites({this.massege, this.data});

  modelfavorites.fromJson(Map<String, dynamic> json) {
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
  String? size;
  String? description;
  int? inFavorites;
  int? inCart;
  int? relations;
  String? color;
  int? sections;
  int?  count;
int? total;
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
        this.sections,
        this.count,
      this.size,
        this.total
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
    size= json['size'];
   // total=json['total'];
    sections = json['sections'];
    count = json['count'];
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
    data['sections'] = this.sections;
    data['count'] = this.count;
    data['size'] = this.size;
   // data['total']=this.total;
    return data;
  }
}