import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/search/cubit/search_cubit.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/search/cubit/search_states.dart';

import '../../../models/shop_app/search_model.dart';
import '../../../models/shop_app/test.dart';
import '../home/cubit/home_cubit.dart';

class Search extends StatelessWidget {
  var s = TextEditingController();
  var f = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var c = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: [
                    defaultTextFiled(
                      controllerr: s,
                      ispassword: false,
                      type: TextInputType.text,
                      valid: (v) {
                        if (v!.isEmpty){
                          return " value mustnt be empty";
                        }
                        return null;
                      },
                      label: 'Enter the name of Product',
                      fontw: FontWeight.bold,
                      fonts: 20,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      submit: (text) {
                        c.searchData(text);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                if (state is SearchSuccess)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => SearchScreen( c.model1!.data.data[index], context),
                          separatorBuilder: (context, index) => Mydivider(),
                          itemCount: c.model1!.data.data.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget SearchScreen( model, context) => Padding(
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
                      model.image,
                    ),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  if (model.discount != 0)
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
                    Text(
                      model.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('gogo'),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.price}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            HomeCubit.get(context).postFav(model.id);
                          },
                          icon: Icon(
                            HomeCubit.get(context).favourite[model.id]!
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded,
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
