import 'package:flutter/material.dart';
import 'package:flutter_getx/routes/app_pages.dart';
import 'package:flutter_getx/utils/style/white_jotter_style.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../res.dart';
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isJump=false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 3000), () {
        if(!isJump){
          Get.offAllNamed(Routes.HOME);
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image(
                      image: AssetImage(Res.wj),
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                skipWidget(),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            Positioned(
              right: 30,
              bottom: 20,
              child: Image(
                image: AssetImage(Res.wj_cat),
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget skipWidget() {
    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        color: WJColors.primaryValue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: FlatButton(
          child: Text(
            "立刻进入",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            isJump=true;
            Get.offAllNamed(Routes.HOME);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
