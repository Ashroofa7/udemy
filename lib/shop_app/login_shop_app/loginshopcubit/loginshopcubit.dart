import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/Remote/DioHelper.dart';
import 'package:testcashehelper/Shared/endpoints.dart';

import '../../../../models/shop_app/shop_app_users_model.dart';

import 'loginshopstates.dart';

class LoginShopCubit extends Cubit<LoginShopStates> {
  LoginShopCubit() : super(LoginShopInitialState());

  static LoginShopCubit get(context) => BlocProvider.of(context);
  late ShopAppModel loginmodel;
  bool ispassword = true;

  void getusers(String email, String password) {
    emit(LoadingLoginShop());
    DioHelper.postdata(url: Login, data: {
      'email': '$email',
      'password': '$password',
    },).then(
          (value) {
        print(value.data);
        loginmodel = ShopAppModel.fromjason(value.data);
        // print(loginmodel.status);
        // print(loginmodel.data?.name);
        // print(loginmodel.data?.email);
        // print(loginmodel.data?.phone);
        // print(loginmodel.message);
        token = loginmodel.data!.token;

        emit(SuccessLoadingShop(loginmodel));
      },
    ).catchError((error) {
      print(error.toString());
      emit(ErrorLoadingShop(error));
    });
  }

  IconData suffix = Icons.visibility;

  void changevisibility() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangeSuffix());
  }

  void registerusers({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(LoadingLoginShop());
    DioHelper.postdata(url: Login, data: {
      'email': '$email',
      'password': '$password',
    }).then(
          (value) {
        print(value.data);
        loginmodel = ShopAppModel.fromjason(value.data);
        // print(loginmodel.status);
        // print(loginmodel.data?.name);
        // print(loginmodel.data?.email);
        // print(loginmodel.data?.phone);
        // print(loginmodel.message);
        // token = loginmodel.data!.token;

        emit(SuccessLoadingShop(loginmodel));
      },
    ).catchError((error) {
      print(error.toString());
      emit(ErrorLoadingShop(error));
    });
  }
}
