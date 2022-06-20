class FavouriteModelScreen {
 late bool status;
 late Data data;
FavouriteModelScreen.fromJson(Map<String,dynamic>Json){
  status= Json['status'];
  data = Data.fromJson(Json['data']);
}
}

class Data {
  List <FavDataa> data2= [];
  Data.fromJson(Map<String,dynamic>Json){
    Json['data'].forEach((element){
      data2.add(FavDataa.fromJson(element));
    });
  }
}
class FavDataa{
  late dynamic id;
  late Pro product;
  FavDataa.fromJson(Map<String,dynamic>Json){
   id= Json['id'];
   product = Pro.fromJson(Json['product']);
  }
}
class Pro{
  late dynamic id ;
  late dynamic price;
  late dynamic oldprice;
  late dynamic discount;
  late String name;
  late String image;
  Pro.fromJson(Map<String,dynamic>Json){
    id = Json['id'];
    price = Json['price'];
    oldprice = Json['old_price'];
    discount = Json['discount'];
    image = Json['image'];
    name= Json['name'];
  }
}