import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsCubit.dart';
import 'package:testcashehelper/Cubits/NewsCubit/NewsState.dart';
import 'package:testcashehelper/Layout/search.dart';

import '../Cubits/NewsCubit/AppCubit.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var c = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('MiniTok'),
              actions: [
                IconButton(
                  onPressed: () {
                    //Navigateto(context, Search());
                  },
                  icon: Icon(
                    Icons.search,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    onPressed: () {
                      AppCubit.get(context).changeappmode();
                    },
                    icon: Icon(
                      Icons.brightness_4_outlined,),
                  ),
                ),
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: c.currentindex,
              onTap: (index) {
                c.changeappindex(index);
              },
              items: c.bottomItems,
            ),
            body: c.screens[c.currentindex],
          );
        });
  }
}
