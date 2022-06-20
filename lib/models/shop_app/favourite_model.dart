class Favourite {
  late bool status;
  late String message;

  Favourite.jsonfrom(Map<String,dynamic>json){
    status= json['status'];
    message = json['message'];
  }
}