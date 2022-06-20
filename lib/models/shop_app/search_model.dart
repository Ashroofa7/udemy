class Search {
  late bool status;
  late Data data;

  Search.fromJson(Map<String,dynamic>Json){
    status = Json['status'];
    data = Data.fromJson(Json['data']);
  }
}

class Data {
  late List<Data1> data= [];

  Data.fromJson(Map<String,dynamic>Json){

    Json['data'].forEach((v){
      data.add(Data1.fromJson(v));
    });
  }
}

class Data1 {
  late dynamic id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;

  Data1.fromJson(Map <String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];

  }
}