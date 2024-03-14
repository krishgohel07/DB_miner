import 'package:dbminer/module/helper/dbhelper/databasehelper.dart';
import 'package:dbminer/module/model/datamodel.dart';
import 'package:get/get.dart';

class Favoritecontroller extends GetxController {
  List<Favoritemodel> favoritedata = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getdata();
  }

  void getdata() async {
    List<Map<String,dynamic>> data = await DataBaseHelper.dataBaseHelper.fetchdata();
    print("***** ${data}");
    favoritedata = data
        .map((e) => Favoritemodel(author: '${e['name']}', quote: '${e['quote']}'))
        .toList();
    print(favoritedata);
    update();
  }
}
