class CategoryModel{
late bool status;
late CategoryData data;
CategoryModel.fromjson(Map<String,dynamic>json){
  status = json['status'];
  data = CategoryData.fromjson(json['data']);
}
}

class CategoryData{
  late int CurrentPage;
  List <Datamodel> data= [];
  CategoryData.fromjson(Map<String,dynamic>json){
    CurrentPage = json['current_page'];
    json['data'].forEach((element){
      data.add(Datamodel.fromjson(element));
    });
  }
}

class Datamodel{
  late int id;
  late String name;
  late String image;
  Datamodel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    name = json['name'];
    image = json['image'];
  }
}