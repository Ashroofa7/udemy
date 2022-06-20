class HomeModel
{
  late bool status;
  late DataHomeModel data;

  HomeModel.fromjson(Map<String,dynamic>json)
  {
    status =json['status'];
    data =DataHomeModel.fromjson(json['data']) ;
  }
}
class DataHomeModel{
  List<BannerModel>banners=[];
  List<ProductModel>products=[];
  DataHomeModel.fromjson(Map<String,dynamic>json){
      json['banners'].forEach((element){
      banners.add(BannerModel.fromjson(element));
    });
      json['products'].forEach((element){
      products.add(ProductModel.fromjson(element));
    });
  }
}

class BannerModel{
  late int id;
  late String image;
  BannerModel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    image=json['image'];
  }
}

class ProductModel{
  late int id;
   late dynamic price;
  late dynamic oldprice;
  late dynamic discount;
  late String  name;
  late String  image;
  late bool infavourite;
  late bool incart;

 ProductModel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    discount=json['discount'];
    oldprice=json['old_price'];
    image=json['image'];
    name= json['name'];
    incart=json['in_cart'];
    infavourite=json['in_favorites'];
 }
}