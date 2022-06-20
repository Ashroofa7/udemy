import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/models/shop_app/favourite_model_screen.dart';

import '../../../Components/components.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates> (
      listener: (context,state){},
      builder: (context,state){
        var c = HomeCubit.get(context).favouriteModelScreen;
        return  ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=> FavScreen(c!.data.data2[index],context),
            separatorBuilder: (context,index)=> Mydivider(),
            itemCount: c!.data.data2.length);
      },
    );
  }
Widget FavScreen(FavDataa model,context)=> Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Image(
                    image: NetworkImage(
                        model.product.image,
                    ),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,

                  ),
                  if (model.product.discount != 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      color: Colors.red,
                      child: Text(
                        'Discount',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.product.name,
                    overflow: TextOverflow.ellipsis,),
                    SizedBox(
                      height: 10,
                    ),
                    Text('gogo'),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.product.price}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            HomeCubit.get(context).postFav(model.product.id);
                          },
                          icon: Icon(
                            HomeCubit.get(context).favourite[model.product.id]!?Icons.favorite :Icons.favorite_outline_rounded,
                          ),
                          color: Colors.deepOrange,
                          iconSize: 37,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
}
