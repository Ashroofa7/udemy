import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_cubit.dart';
import 'package:testcashehelper/shop_app/shop_app_layouts/home/cubit/home_states.dart';

import '../../../Shared/Local/sharedpreferences.dart';
import '../../login_shop_app/loginshopscreen/login_shop_app_screen.dart';

class Settings extends StatelessWidget {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = HomeCubit.get(context);
        var model = HomeCubit.get(context).usermodel;
        name.text = model!.data!.name;
        email.text = model.data!.email;
        phone.text = model.data!.phone;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is UpdateLoading)
                  LinearProgressIndicator(),
                SizedBox(height: 15,),
                defaultTextFiled(
                  ispassword: false,
                  controllerr: name,
                  type: TextInputType.text,
                  valid: (value) {},
                  label: 'Name',
                  fontw: FontWeight.bold,
                  fonts: 15,
                  prefix: Icons.person,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultTextFiled(
                  ispassword: false,
                  controllerr: email,
                  type: TextInputType.text,
                  valid: (value) {},
                  label: 'E-mail',
                  fontw: FontWeight.bold,
                  fonts: 15,
                  prefix: Icons.email,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultTextFiled(
                  ispassword: false,
                  controllerr: phone,
                  type: TextInputType.number,
                  valid: (value) {},
                  label: 'Phone',
                  fontw: FontWeight.bold,
                  fonts: 15,
                  prefix: Icons.phone,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {

                        c.updateprofile(name: name.text, phone: phone.text, email: email.text);
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.deepOrange,
                      height: 50,
                    ),
                  ),
                ),
                Container(

                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      c.logOut();
                      c.SignnOut(context);
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    color: Colors.deepOrange,
                    height: 50,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
