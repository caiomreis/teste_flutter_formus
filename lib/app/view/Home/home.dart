import 'package:Formus/app/components/text/headline/headline.dart';
import 'package:Formus/app/style/app_colors.dart';
import 'package:Formus/app/view/Home/home_controlller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Headline.medium(
            text: "Formus Teste",
            color: FormusColors.theme.neutral.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: FormusColors.theme.blue.medium,

          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                color: FormusColors.theme.blue.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
