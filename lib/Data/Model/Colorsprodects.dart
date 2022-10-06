class colorsprodect {
  String? massege;
  Data? data;

  colorsprodect({this.massege, this.data});

  colorsprodect.fromJson(Map<String, dynamic> json) {
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
  int? white;
  int? yellow;
  int? blue;
  int? red;
  int? id;
  int? green;
  int? black;
  int? brown;
  int? azure;
  int? silver;
  int? purple;
  int? gray;
  int? orange;

  Data(
      {this.white,
        this.yellow,
        this.blue,
        this.red,
        this.id,
        this.green,
        this.black,
        this.brown,
        this.azure,
        this.silver,
        this.purple,
        this.gray,
        this.orange});

  Data.fromJson(Map<String, dynamic> json) {
    white = json['White'];
    yellow = json['Yellow'];
    blue = json['Blue'];
    red = json['Red'];
    id = json['id'];
    green = json['Green'];
    black = json['Black'];
    brown = json['Brown'];
    azure = json['Azure'];
    silver = json['Silver'];
    purple = json['Purple'];
    gray = json['Gray'];
    orange = json['Orange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['White'] = this.white;
    data['Yellow'] = this.yellow;
    data['Blue'] = this.blue;
    data['Red'] = this.red;
    data['id'] = this.id;
    data['Green'] = this.green;
    data['Black'] = this.black;
    data['Brown'] = this.brown;
    data['Azure'] = this.azure;
    data['Silver'] = this.silver;
    data['Purple'] = this.purple;
    data['Gray'] = this.gray;
    data['Orange'] = this.orange;
    return data;
  }
}