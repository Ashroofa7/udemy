import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/shop_app/register_shop_app/register_states.dart';

import '../../Components/components.dart';
import '../../Shared/Remote/DioHelper.dart';
import '../../Shared/endpoints.dart';
import '../../models/shop_app/shop_app_users_model.dart';

class Registershopapp extends Cubit<RegisterStates>{

  Registershopapp(): super(IniitialStates());

  static Registershopapp get(context)=> BlocProvider.of(context);

  late ShopAppModel loginmodel;

  bool ispassword = true;

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
    emit(LoadingRegisterShop());
    DioHelper.postdata(url: Register, data: {
      'email': '$email',
      'password': '$password',
      'phone': '$phone',
      'name':'$name',
    }).then(
          (value) {
        print(value.data);
        loginmodel = ShopAppModel.fromjason(value.data);
        // print(loginmodel.status);
        // print(loginmodel.data?.name);
        // print(loginmodel.data?.email);
        // print(loginmodel.data?.phone);
        // print(loginmodel.message);
        token = loginmodel.data!.token;

        emit(SuccessRegisterShop(loginmodel));
      },
    ).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterShop(error));
    });
  }
}