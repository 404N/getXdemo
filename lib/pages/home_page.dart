import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/personal_page.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'index_page.dart';
import 'library_page.dart';
import 'note_page.dart';

class HomePage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.pencil), label: '笔记本'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book_solid), label: '图书馆'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '个人中心')
  ];

  final List<Widget> tabBodies = [
    IndexPage(),
    NotePage(),
    LibraryPage(),
    PersonalPage(),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          body: PageView.builder(
            //要点1
            physics: NeverScrollableScrollPhysics(),
            //禁止页面左右滑动切换
            controller: _pageController,
            //回调函数
            itemCount: 4,
            itemBuilder: (context, index) => tabBodies[index],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _._index.value,
            items: bottomTabs,
            onTap: (index) {
              _._index.value=index;
              _pageController.jumpToPage(index);
            },
          ),
        );
      },
    );
  }
}

class HomeController extends GetxController {
  var _index = 0.obs;

  set obj(value) => _index.value = value;

  get obj => _index.value;

}
