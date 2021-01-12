import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Page')),
      body: Container(
        child: Container(
          child:Text("personal"),
        ),
      ),
    );
  }
}

class MyController extends GetxController {

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}