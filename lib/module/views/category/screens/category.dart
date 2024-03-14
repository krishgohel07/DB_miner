import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/apihelper/apihelper.dart';
import '../../../util/utildata.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => InkWell(
            onTap: () async {
              await APIHelper.apiHelper
                  .fetchcategory(category[index]['name']);
              Get.toNamed('one',arguments: index);
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
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )),
    );
  }
}
