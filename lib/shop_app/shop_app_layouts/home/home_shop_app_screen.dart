import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/Local/sharedpreferences.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_cubit.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_states.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/search/search.dart';

import '../../login_shop_app/loginshopscreen/login_shop_app_screen.dart';


class Home_Shop_app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context,state){
        var c = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Shop App'),
            actions: [
              IconButton(onPressed: (){

                Navigateto(context, Search());
                //token='';
              }, icon: Icon(Icons.search))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: c.currentindex,
            onTap: (index){
              c.changeindex(index);
            },
            items:c.HomeBotItem,
          ),
          body: c.ShopScreens[c.currentindex],

        );

      },
    );
  }
}
