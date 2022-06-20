import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Social_States.dart';

class SocialCubit extends Cubit<Social_states>{
  SocialCubit() : super(InitialStates());
  static SocialCubit get(context)=> BlocProvider.of(context);

  bool ispassword =true ;
  IconData suffix = Icons.visibility;
  void changepassword (){
    ispassword=!ispassword;
    suffix= ispassword?Icons.visibility : Icons.visibility_off;
    emit(Changepassword());
  }


}