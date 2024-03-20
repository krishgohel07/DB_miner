import 'dart:convert';
import 'package:dbminer/module/model/datamodel.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();
  List<Datamodel> allquotes = [];
  List<Map<String, dynamic>> datas = [];
  List tempdata = [];

  Future<void> fetchquotes() async {
    final api = Uri.parse('https://api.quotable.io/random');
    http.Response response = await http.get(api);
    if (response.statusCode == 200) {
      String data = response.body;
      datas.add(jsonDecode(data));
    }
    //allquotes = datas
    //  .map((e) => Datamodel(author: e['author'], quote: e['content']))
    //.toList();
    print("=========================== ${datas.length}");
    print(datas);
  }

  Future<void> fetchcategory(String name) async {
    print("1");
    const apikey = 'oiSNPKmfeKCBwfolykjjxQ==RcM0EYUzNqrFgUhf';
    final api =
        Uri.parse('https://api.api-ninjas.com/v1/quotes?category=$name');
    for (int i = 0; i < 5; i++) {
      print("2");
      http.Response response =
          await http.get(api, headers: {'X-API-Key': apikey});
      print("3");
      if (response.statusCode == 200) {
        String data = response.body;
        tempdata.add(jsonDecode(data));
      }
      allquotes = tempdata
          .map((e) => Datamodel(author: e[0]['author'], quote: e[0]['quote']))
          .toList();
    }
    print("${allquotes.length}");
  }
}
