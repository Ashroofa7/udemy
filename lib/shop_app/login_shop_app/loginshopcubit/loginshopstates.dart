import '../../../../models/shop_app/shop_app_users_model.dart';


abstract class LoginShopStates{}

class LoginShopInitialState extends LoginShopStates{}

class LoadingLoginShop extends LoginShopStates{}

class SuccessLoadingShop extends LoginShopStates{
  final ShopAppModel loginmodel;

  SuccessLoadingShop(this.loginmodel);
}

class ErrorLoadingShop extends LoginShopStates{
  final error;

  ErrorLoadingShop(this.error);

}

class ChangeSuffix extends LoginShopStates{}

