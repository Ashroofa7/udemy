import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_states.dart';


class RegisterSocial extends Cubit<RegisterSocialStates> {
  RegisterSocial() : super(InitialStates());

  static RegisterSocial get(context) => BlocProvider.of(context);

  void UserRegisteration({
    required String email,
    required String user,
    required String password,
    required int phone,
  }) {
    emit(LoadingRegisteSocialState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
          print(value.user!.email);
      emit(SuccessRegisterSocialState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterSocialState());
    });
  }
}
