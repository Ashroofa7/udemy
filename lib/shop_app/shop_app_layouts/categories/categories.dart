import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/models/shop_app/categories_model.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_cubit.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_states.dart';

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var d = HomeCubit.get(context).Catmodel;
        return Scaffold(
          body:  ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>CategoryBuild(d!.data.data[index]),
            separatorBuilder: (context, index) =>SizedBox(height: 15,),
            itemCount: d!.data.data.length,),

        );
      },
    );
  }

  Widget CategoryBuild(Datamodel datamodel)=> Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(datamodel.image),
          width: 120,
          height: 120,
          fit: BoxFit.cover,),
        SizedBox(width: 20,),
        Text(datamodel.name,
        style: TextStyle(
          fontSize: 20,
        ),),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,),)
      ],
    ),
  );


}
