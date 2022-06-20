import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Cubits/NewsCubit/AppStates.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsState.dart';

import '../Cubits/NewsCubit/AppCubit.dart';
import '../Cubits/NewsCubit/NewsCubit.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder:  (context,state){
          var list = NewsCubit.get(context).search;
          var c = TextEditingController();
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFiled(
                      controllerr: c,
                      type: TextInputType.text,
                      valid: (value){},
                      label: 'Search',
                      fontw: FontWeight.bold,
                      fonts: 20,
                      ispassword: false,
                      change: (value){
                        NewsCubit.get(context).getSearch(value);
                      },

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15,),

                    ),
                      prefix: (Icons.search),
                      color1: Theme.of(context).primaryColor,
                      color2: Theme.of(context).primaryColor,
                      style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                    child: Arttok(list,isshared:true),
                ),
              ],
            ),
          );
        },
        );
  }
}
