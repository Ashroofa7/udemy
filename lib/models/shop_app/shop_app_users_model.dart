class ShopAppModel{
  late bool status;
  late String message;
  late Usersdata? data;

  ShopAppModel.fromjason(Map<String,dynamic>jason){
    status = jason['status'];
    message = jason['message'];
    data = jason['data']!=null ? Usersdata.fromjason(jason['data'] ) : null;


  }
}
class Usersdata{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;
  late int points;
  late int credit;

  Usersdata.fromjason(Map<String,dynamic>jason){
   id=jason['id'];
   name=jason['name'];
   email=jason['email'];
   phone=jason['phone'];
   image=jason['image'];
   token=jason['token'];
   points=jason['points'];
   credit=jason['credit'];

  }
}