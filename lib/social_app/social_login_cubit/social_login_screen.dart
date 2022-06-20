import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';

import '../social_register_cubit/social_register_screen.dart';
import 'cubitt/Cubit.dart';
import 'cubitt/Social_States.dart';

class Social_Login_Screen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => SocialCubit(),
        child: BlocConsumer<SocialCubit, Social_states>(
          listener: (context, state) {},
          builder: (context, state) {
            var c = SocialCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      defaultTextFiled(
                          controllerr: email,
                          type: TextInputType.emailAddress,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return 'Password Must Not Be Empty';
                            }
                          },
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefix: Icons.email,
                          label: 'E-mail',
                          fontw: FontWeight.bold,
                          fonts: 20),
                      SizedBox(
                        height: 50,
                      ),
                      defaultTextFiled(
                          controllerr: password,
                          type: TextInputType.text,
                          prefix: Icons.lock,
                          valid: (value) {
                            if (value!.isEmpty) {
                              return 'Password Must Not Be Empty';
                            }
                          },
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffix: c.suffix,
                          suffixpresed: () {
                            c.changepassword();
                          },
                          label: 'Password',
                          ispassword: c.ispassword,
                          fontw: FontWeight.bold,
                          fonts: 20),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Center(
                               child: Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                            ),
                             ),
                            TextButton(
                                onPressed: () {
                                  Navigateto(context, SocialRegister());
                                },
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
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
