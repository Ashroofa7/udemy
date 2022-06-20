class search11 {
  late bool status;
  late Null message;
  late Data1 data;


  search11.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data1.fromJson(json['data1']);
  }
}

class Data1 {
  int? currentPage;
  late List<Data2> data=[];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data1.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data2'].forEach((v) {
        data.add(new Data2.fromJson(v));
      });

    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class Data2 {
  late dynamic id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late String description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Data2.fromJson(Map <String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
