import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:dbminer/module/helper/dbhelper/databasehelper.dart';
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
      body: GetBuilder<Favoritecontroller>(
        builder: (controller) => Container(
          child: (favoritecontroller.favoritedata.isEmpty)
              ? Center(
                  child: Text("Your favorite list is empty"),
                )
              : ListView.builder(
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
                                onPressed: () {
                                  favoritecontroller
                                      .deletedata(favoritecontroller
                                          .favoritedata[index].quote)
                                      .then((value) {
                                    Get.snackbar('success',
                                        'Removed From Favorite List');
                                  });
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 35, right: 35, top: 10, bottom: 15),
                          child: SingleChildScrollView(
                            child: Text(
                              "${favoritecontroller.favoritedata[index].quote}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        Text(
                            " -  ${favoritecontroller.favoritedata[index].author}")
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
