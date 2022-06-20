import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Layout/WebView.dart';

class Tempo extends StatelessWidget {
  const Tempo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigateto(context, Web('https://www.google.com'));
          }, icon: Icon(Icons.search),),
        ],
      ),
      body: InkWell(
        onTap: (){
          Navigateto(context, Web('https://www.youtube.com'));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            child: Center(child: Text('Gege')),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15,),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
