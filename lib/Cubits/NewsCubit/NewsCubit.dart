import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Layout/Business.dart';
import 'package:testcashehelper/Shared/Local/sharedpreferences.dart';
import 'package:testcashehelper/Shared/Remote/DioHelper.dart';

import 'NewsState.dart';

class NewsCubit extends Cubit<NewsStates>{
 NewsCubit(): super(InitialStates());

 static NewsCubit get(context) => BlocProvider.of(context);

 List<BottomNavigationBarItem> bottomItems =  [
   BottomNavigationBarItem(label:'Home',icon:Icon(Icons.home), ),
   BottomNavigationBarItem(label:'Discover',icon:Icon(Icons.rocket), ),
   BottomNavigationBarItem(label:'' ,icon:Icon(Icons.add_box),),
   BottomNavigationBarItem(label:'Inbox',icon:Icon(Icons.inbox_sharp), ),
   BottomNavigationBarItem(label:'Profile',icon:Icon(Icons.person), ),
 ];
 
 List<dynamic> business = [];
 List<dynamic> search = [];

 List <Widget> screens = [
  Business(),
 ];
  bool islight = true;
  int currentindex= 0;
 void changeappindex(index){
   currentindex= index;
   emit(ChangeIndex());
 }
 void getBusiness(){
   emit(Loadingcircular());
   DioHelper.getdata(
       url: 'v2/top-headlines',
       query: {
         'country':'eg',
         'category':'sports',
         'apiKey':'209e1870bb784ed6960686a7e26921be',
       }).then((value) {
      business= value.data['articles'];
      print(business[0]);
      emit(SuccessBusinessState());
   }).catchError((error){
    print(error.toString());
    emit(ErrorBusinessState(error));
   });
 }

 void getSearch(String value){
   //emit(Loadingcircular());
   DioHelper.getdata(
       url: 'v2/everything',
       query: {
         'q': '$value',
         'apiKey':'209e1870bb784ed6960686a7e26921be',
       }).then((value) {
     search= value.data['articles'];
     //print(search[0]);
     emit(SuccessSearchState());
   }).catchError((error){
     print(error.toString());
     emit(ErrorSearchState(error));
   });
 }

}