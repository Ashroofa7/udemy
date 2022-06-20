
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/Remote/DioHelper.dart';
import 'package:testcashehelper/Shared/endpoints.dart';
import 'package:testcashehelper/models/shop_app/categories_model.dart';
import 'package:testcashehelper/models/shop_app/favourite_model_screen.dart';
import 'package:testcashehelper/models/shop_app/home_model.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/categories/categories.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/favourites/favourites.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_states.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/home_shop_app_screen.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/settings/settings.dart';

import '../../../../Shared/Local/sharedpreferences.dart';
import '../../../../models/shop_app/favourite_model.dart';
import '../../../../models/shop_app/shop_app_users_model.dart';
import '../../../login_shop_app/loginshopscreen/login_shop_app_screen.dart';
import '../../products/products.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> ShopScreens = [
    Products(),
    Categories(),
    Favourites(),
    Settings(),
  ];

  void changeindex(index) {
    currentindex = index;
    emit(ChangeBottomIndex());
  }

  List<BottomNavigationBarItem> HomeBotItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: 'Favourite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  HomeModel? model;
  Map<int, bool> favourite = {};

  void getproducts() {
    DioHelper.getdata(
      url: Home,
      token: token,
    ).then((value) {
      model = HomeModel.fromjson(value.data);
      //print(model?.data.banners[0].image);
      //print(model?.data.products[0].image);
      model!.data.products.forEach((element) {
        favourite.addAll({
          element.id: element.infavourite,
        });
      });
      // print(favourite.toString());
      emit(homemodelstat());
    }).catchError((error) {
      print(error.toString());
      emit(homemodelerrorstat());
    });
  }

  CategoryModel? Catmodel;

  void getcategories() {
    DioHelper.getdata(url: Category, token: token).then((value) {
      Catmodel = CategoryModel.fromjson(value.data);
      print(token);
      //     print(Catmodel?.data.data[0].image);
      emit(datamodelstat());
    }).catchError((error) {
      print(error.toString());
      emit(datamodelerrorstat());
    });
  }

  Favourite? favourites;

  void postFav(int pro_id) {
    emit(LoadingFavScreen());
    favourite[pro_id] = !favourite[pro_id]!;
    emit(datafavestat());
    DioHelper.postdata(
      url: Fav,
      data: {'product_id': pro_id},
      token: token,
    ).then((value) {
      favourites = Favourite.jsonfrom(value.data);
      if (!favourites!.status)
        favourite[pro_id] = !favourite[pro_id]!;
      else
        getFav();

      emit(datafavsuccessestat());
    }).catchError((error) {
      favourite[pro_id] = !favourite[pro_id]!;
      emit(datafaverrorstat());
    });
  }

  FavouriteModelScreen? favouriteModelScreen;

  void getFav() {
    DioHelper.getdata(url: Fav, token: token).then((value) {
      favouriteModelScreen = FavouriteModelScreen.fromJson(value.data);
      emit(datagetfavsuccessestat());
    }).catchError((error) {
      print(error.toString());
      emit(datagetfaverrorstat());
    });
  }

  ShopAppModel? usermodel;

  void getprofile() {
    emit(LoadingSettingsScreen());
    DioHelper.getdata(
      url: PROFILE,
      token: token,
    ).then((value) {
      usermodel = ShopAppModel.fromjason(value.data);
      print(usermodel?.data);
      emit(userssuccessestat());
    }).catchError((error) {
      print(error.toString());
      emit(usserserrorstat());
    });
  }

  void updateprofile({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(UpdateLoading());
    DioHelper.putdata(
      url: UPDATE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
      },
    ).then((value) {
      getprofile();
      emit(UpdateSuccess());
    }).catchError((error) {

      emit(UpdateError(error.toString()));
    });
  }

  void SignnOut(context) {
    Navigateandfinish(context, Login_Shop_App());
    //CasheHelper.removeData(key: token);
    emit(tokendeleted());
  }


  void logOut (){
    DioHelper.postdata(url: LOGOUT, data: {
      'fcm_token': token,
    },).then((value){
      emit(LogoutSuccess());
    }).catchError((error){

      emit(LogoutError(error.toString()));
    });
  }
}
