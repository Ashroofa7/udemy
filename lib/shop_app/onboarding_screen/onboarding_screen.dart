import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testcashehelper/Components/components.dart';
import 'package:testcashehelper/Shared/Local/sharedpreferences.dart';

import '../login_shop_app/loginshopscreen/login_shop_app_screen.dart';

class Onboarding {
  final String title;
  final String headline;
  final String image;
  Onboarding({
   required this.title,
   required this.headline,
   required this.image,
});
}

class Onboarding_Screen extends StatefulWidget {
 bool onboarding = true;
  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  var controller = PageController();

  List<Onboarding>boardinglist = [];
  bool onboarding = true;

  bool islast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            CasheHelper.savedata(key: 'onboarding', value: onboarding)
                .then((value){
              Navigateandfinish(context, Login_Shop_App());
            });

          },
              child: Text('SKIP',style: TextStyle(
                color: Colors.white,
                  fontSize:25 ,
              ),),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context, index) => OnBoardScreen(boardinglist[index]),
                itemCount:  3,
                controller: controller,
                onPageChanged: (index){
                  if(index == boardinglist.length-1){
                    setState(() {
                      islast = true;
                    });
                  }else{
                    setState(() {
                      islast=false;
                    });
                  }
                },
              ),
            ),
        Row(
          children: [
            SmoothPageIndicator(
                controller:controller,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5,
                ),
                count:boardinglist.length ),
            Spacer(),
            FloatingActionButton(onPressed: (){
              if(islast){
                CasheHelper.savedata(key: 'onboarding', value: onboarding)
                    .then((value) {
                  Navigateandfinish(context, Login_Shop_App());
                });
              }else{
                controller.nextPage(
                    duration: const Duration(
                        microseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            },
              child: Icon(Icons.arrow_forward_ios_outlined),),
          ],
        ),
          ],
        ),
      ),
    );
  }

  Widget OnBoardScreen(Onboarding model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image:AssetImage('${model.image}'), ),
      ),
      SizedBox(
        height: 30,
      ),
      Text('${model.title}',style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      ),
      SizedBox(
        height: 30,),
      Text('${model.headline}',
        style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      SizedBox(
        height: 30,
      ),
    ],
  );
}

