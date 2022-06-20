import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/Local/sharedpreferences.dart';


import '../../shop_app_layouts/home/home_shop_app_screen.dart';
import '../../shop_app_layouts/register/register.dart';
import '../loginshopcubit/loginshopcubit.dart';
import '../loginshopcubit/loginshopstates.dart';

class Login_Shop_App extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => LoginShopCubit(),
        child: BlocConsumer<LoginShopCubit, LoginShopStates>(
          listener: (context, state) {
            CasheHelper.removeData(key: token);

            if (state is SuccessLoadingShop) {
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
            var c = LoginShopCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
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
                          'Login now see our unique offers',
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
                          controllerr: emailcontroller,
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
                          height: 20,
                        ),
                        defaultTextFiled(
                          controllerr: passwordcontroller,
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
                              condition: state is! LoadingLoginShop,
                              builder: (context) => MaterialButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    c.getusers(emailcontroller.text,
                                        passwordcontroller.text);
                                  }
                                },
                                child: Text(
                                  'LOGIN',
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
                        Row(
                          children: [
                            Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigateto(context, Registerr());
                              },
                              child: Text('Register Now '),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
