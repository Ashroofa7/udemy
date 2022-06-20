import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/shop_app/register_shop_app/register_cubit.dart';

import '../../../Components/components.dart';
import '../../../Shared/Local/sharedpreferences.dart';
import '../../login_shop_app/loginshopcubit/loginshopcubit.dart';
import '../../login_shop_app/loginshopcubit/loginshopstates.dart';
import '../../register_shop_app/register_states.dart';
import '../home/home_shop_app_screen.dart';

class Registerr extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Registershopapp(),
      child: BlocConsumer<Registershopapp, RegisterStates>(
        listener: (context, state) {
          if (state is SuccessRegisterShop) {
            if (state.loginmodel.status) {
              CasheHelper.savedata(
                      key: 'token', value: state.loginmodel.data?.token)
                  .then((value) {
                Toasts(
                  message: state.loginmodel.message,
                  state: ToastsState.Success,
                );
                Navigateandfinish(context, Home_Shop_app());
              });
            } else {
              Toasts(
                message: state.loginmodel.message,
                state: ToastsState.Error,
              );
            }
          }
        },
        builder: (context, state) {
          var c = Registershopapp.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Register now see our unique offers',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFiled(
                          controllerr: name,
                          type: TextInputType.text,
                          label: 'Name',
                          fontw: FontWeight.bold,
                          fonts: 25,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return 'value mustnot be empty';
                            }
                          },
                          ispassword: false,
                          prefix: Icons.person,
                          radius: 15,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          color1: Colors.black,
                          color2: Colors.black,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFiled(
                          controllerr: email,
                          type: TextInputType.emailAddress,
                          label: 'E-mail',
                          fontw: FontWeight.bold,
                          fonts: 25,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return 'value mustnot be empty';
                            }
                          },
                          ispassword: false,
                          prefix: Icons.email_outlined,
                          radius: 15,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          color1: Colors.black,
                          color2: Colors.black,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFiled(
                          controllerr: phone,
                          type: TextInputType.phone,
                          label: 'Phone',
                          fontw: FontWeight.bold,
                          fonts: 25,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return 'value mustnot be empty';
                            }
                          },
                          ispassword: false,
                          prefix: Icons.phone,
                          radius: 15,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          color1: Colors.black,
                          color2: Colors.black,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFiled(
                          controllerr: password,
                          type: TextInputType.text,
                          label: 'Password',
                          fontw: FontWeight.bold,
                          fonts: 25,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return 'value mustnot be empty';
                            }
                          },
                          submit: (value) {},
                          suffix: c.suffix,
                          suffixpresed: () {
                            c.changevisibility();
                          },
                          ispassword: c.ispassword,
                          prefix: Icons.lock_outlined,
                          radius: 15,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          color1: Colors.black,
                          color2: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            color: Colors.grey[700],
                            child: ConditionalBuilder(
                              condition: state is! LoadingRegisterShop,
                              builder: (context) => MaterialButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    c.registerusers(
                                        email: email.text,
                                        password: password.text,
                                        phone: phone.text,
                                        name: name.text);
                                  }
                                },
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              fallback: (Context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
