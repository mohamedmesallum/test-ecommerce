class Categories{
 late String Massage;
late listdata datalist;
Categories({required this.datalist,required this.Massage});

  Categories.fromjson(Map<String,dynamic>json){
    Massage=json["Massege"];
    datalist = listdata.fromjson(json["data"]);


  }
//categories.datalist.datacatgre[0].name
}
class listdata{
  List<dynamic> datacatgre=[];
  listdata({required this.datacatgre});
  listdata.fromjson(Map<String,dynamic>json){
    json["data"].forEach((elemnet){
      datacatgre.add(data.fromjson(elemnet));
    });
  }
}

class data{
  late int id;
  late String name;
  late String image;
  data({required this.name,required this.image,required this.id
 });
  data.fromjson(Map<String,dynamic>json){
    id=json['c_id'];
    name =json['c_name'];
    image = json['c_image'];
  }
}