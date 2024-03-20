import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:dbminer/module/helper/dbhelper/databasehelper.dart';
import 'package:dbminer/module/util/utildata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brilliant Quotes"),
        actions: [
          IconButton(onPressed: (){
            Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
          }, icon:(Get.isDarkMode)?Icon(Icons.dark_mode_outlined):Icon(Icons.light_mode_outlined)),
          SizedBox(width: 2,),
          IconButton(
              onPressed: () {
                Get.toNamed('favorite');
              },
              icon: Icon(Icons.favorite_outline_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Your Daily Quote",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff211610),
            ),
            child: APIHelper.apiHelper.datas != null &&
                    APIHelper.apiHelper.datas.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                DataBaseHelper.dataBaseHelper
                                    .insertdata(
                                        APIHelper.apiHelper.datas[0]['author'],
                                        APIHelper.apiHelper.datas[0]['content'])
                                    .then((value) => Get.snackbar(
                                        'Success', 'Quote Added to Favorite'));
                              },
                              icon: Icon(Icons.favorite_outline_rounded))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Text(
                            "${APIHelper.apiHelper.datas[0]['content']}",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Text(" -  ${APIHelper.apiHelper.datas[0]['author']}",style: TextStyle(color: Colors.white),)
                    ],
                  )
                : Center(
                    child: Text(
                      "No quotes available",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 40,
                width: 80,
                color: Colors.transparent,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('category');
                  },
                  child: Text("See All"),
                ),
              )
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        APIHelper.apiHelper.allquotes.clear();
                         APIHelper.apiHelper
                            .fetchcategory(category[index]['name']);
                        Get.toNamed('one', arguments: index);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: category[index]['color'],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "${category[index]['name']}",
                            style: TextStyle(fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
