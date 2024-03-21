import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:get/get.dart';

class OneController extends GetxController{
  void deletelist(){
    APIHelper.apiHelper.tempdata.clear();
    APIHelper.apiHelper.allquotes.clear();
    update();
  }
}