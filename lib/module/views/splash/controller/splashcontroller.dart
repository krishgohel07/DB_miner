import 'dart:async';

import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:dbminer/module/helper/dbhelper/databasehelper.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    DataBaseHelper.dataBaseHelper.initdb();
    await APIHelper.apiHelper
        .fetchquotes()
        .then((value) => Timer(Duration(seconds: 1), () {
              Get.toNamed('/');
            }));
  }
}
