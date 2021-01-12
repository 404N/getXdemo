import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/style/white_jotter_style.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页",style: WjStyle.appBarStyle,),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child:Text("index"),
      ),
    );
  }
}

class MyController extends GetxController {

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
