import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/endpoints.dart';
import 'package:testcashehelper/models/shop_app/categories_model.dart';
import 'package:testcashehelper/models/shop_app/home_model.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_cubit.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_states.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is datafavsuccessestat){
          if ( !HomeCubit.get(context).favourites!.status)
          Toasts(state: ToastsState.Error , message: HomeCubit.get(context).favourites!.message );}
      },
      builder: (context, state) {
        var c = HomeCubit.get(context).model;
        var t = HomeCubit.get(context).Catmodel;
        return ConditionalBuilder(
          condition: c != null,
          builder: (context) => Productsbuilder(c!,t!,context),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget Productsbuilder(HomeModel model,CategoryModel Cmodel,context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data.banners
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 250,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                reverse: false,
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  5.0),
              child: Row(
                children: [
                  Text('Categories',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              width: double.infinity,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildCategories(Cmodel.data.data[index]),
                  separatorBuilder: (context,index)=> SizedBox(width:10,),
                  itemCount: Cmodel.data.data.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all( 5.0),
              child: Row(
                children: [
                  Text('New Products',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.47,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(
                  model.data.products.length,
                  (index) => BuildProducts(model.data.products[index],context),
                ),
              ),
            ),
          ],
        ),
      );

  Widget BuildProducts(ProductModel model,context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image(
                    image: NetworkImage(model.image),
                    width: double.infinity,
                    height: 200,
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                model.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${model.price}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (model.oldprice != model.price)
                    Text(
                      '${model.oldprice}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 15,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                     HomeCubit.get(context).postFav(model.id);
                    },
                    icon: Icon(
                      HomeCubit.get(context).favourite[model.id]!?Icons.favorite :Icons.favorite_outline_rounded,
                    ),
                    color: Colors.deepOrange,
                    iconSize: 37,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget BuildCategories(Datamodel datamodel )=> Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image(
                image: NetworkImage(
                  datamodel.image ),
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
              Container(
                width: 120,
                color: Colors.black,
                child: Text(datamodel.name,
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
