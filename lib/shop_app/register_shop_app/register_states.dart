import '../../../models/shop_app/shop_app_users_model.dart';

abstract class RegisterStates {}
class IniitialStates extends RegisterStates{}

class LoadingRegisterShop extends RegisterStates{}

class SuccessRegisterShop extends RegisterStates{
  final ShopAppModel loginmodel;

  SuccessRegisterShop(this.loginmodel);
}

class ErrorRegisterShop extends RegisterStates{
  final error;

  ErrorRegisterShop(this.error);
}
class ChangeSuffix extends RegisterStates{}