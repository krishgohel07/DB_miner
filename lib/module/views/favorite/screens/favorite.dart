import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:dbminer/module/util/utildata.dart';
import 'package:dbminer/module/views/favorite/controller/favoritecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    Favoritecontroller favoritecontroller = Get.put(Favoritecontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite List"),
        ),
        body: (favoritecontroller.favoritedata.isEmpty)
            ? Center(
                child: Text("Your favorite list is empty"),
              )
            : GetBuilder<Favoritecontroller>(
                builder: (controller) => ListView.builder(
                  itemCount: favoritecontroller.favoritedata.length,
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: category[index]['color'],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_outline_rounded))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 35, right: 35, top: 10, bottom: 15),
                          child: SingleChildScrollView(
                            child: Text(
                              "${APIHelper.apiHelper.allquotes[index].quote}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        Text(
                            " -  ${APIHelper.apiHelper.allquotes[index].author}")
                      ],
                    ),
                  ),
                ),
              ));
  }
}
