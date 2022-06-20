import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Local/sharedpreferences.dart';
import 'AppStates.dart';

 class AppCubit extends Cubit<AppStates>{
  AppCubit(): super (InitialAppStates());

  static AppCubit get(context)=> BlocProvider.of(context);

  bool islight=true;
  void changeappmode( {bool? fromMode }){
    if (fromMode != null){
      islight = fromMode;
      emit(changemooddark());
    }
    else {
      islight = !islight;
      CasheHelper.savedata(
          key: 'islight', value: islight)
          .then((value) {
        emit(changemooddark());
      }).catchError((error) {
        print(error.toString());
      });
    }
  }


}