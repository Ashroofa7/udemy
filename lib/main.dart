// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Cubits/NewsCubit/AppStates.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsCubit.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsState.dart';
import 'package:testcashehelper/Shared/Local/sharedpreferences.dart';
import 'package:testcashehelper/Shared/Remote/DioHelper.dart';
import 'package:testcashehelper/Shared/themes/themes.dart';
import 'package:testcashehelper/shop_app/login_shop_app/loginshopscreen/login_shop_app_screen.dart';
import 'package:testcashehelper/shop_app/onboarding_screen/onboarding_screen.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_cubit.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/home_shop_app_screen.dart';

import 'BlocObserver/BlocObserver.dart';
import 'Components/components.dart';
import 'Cubits/NewsCubit/AppCubit.dart';
import 'social_app/social_login_cubit/social_login_screen.dart';

void main() {
 BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      DioHelper.init();
      await CasheHelper.init();
     bool islight = CasheHelper.getdata(key: 'islight');
      bool onboarding = CasheHelper.getdata(key: 'onboarding');
      token = CasheHelper.getdata(key: 'token');
      Widget widget;
      if(onboarding != null ){
        if(token== null)
          widget= Login_Shop_App();
        else
          widget= Home_Shop_app();
      }else{
        widget= Onboarding_Screen();
      }
      runApp(Myapp(
        islight: islight,
        widget: widget,
       ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class Myapp extends StatelessWidget {
  final bool islight;
  final Widget widget;

  Myapp({
    this.islight,
    this.widget,
   });

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            NewsCubit()
              ..
              getBusiness(),),
          BlocProvider(create: (context) =>
          AppCubit()
            ..changeappmode(),),
          BlocProvider(create: (context)=>
          HomeCubit()..getproducts()..getcategories()..getFav()..getprofile(),),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var c = AppCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Test',
              theme: light,
              darkTheme: dark,
              themeMode: ThemeMode.light,
             //themeMode: c.islight ? ThemeMode.light : ThemeMode.dark,
              home:Social_Login_Screen(),
            );
          },
        ),
      );
  }
// Widget startwidget(){
//     if(onboarding){
//       if(token== null)
//         return Login_Shop_App();
//       else
//         return Home_Shop_app();
//     }else
//       return Onboarding_Screen();
// }

}


