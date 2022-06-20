import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsCubit.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsState.dart';

import '../Components/components.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).business;
        return Scaffold(
          body:Arttok(list),
        );
      },
    );
  }
}
