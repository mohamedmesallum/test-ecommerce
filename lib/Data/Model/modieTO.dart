class categories {
  String? massege;
  List<Data>? data;

  categories({this.massege, this.data});

  categories.fromJson(Map<String, dynamic> json) {
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
  int? cId;
  String? cName;
  String? cImage;

  Data({this.cId, this.cName, this.cImage});

  Data.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    cName = json['c_name'];
    cImage = json['c_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_id'] = this.cId;
    data['c_name'] = this.cName;
    data['c_image'] = this.cImage;
    return data;
  }
}