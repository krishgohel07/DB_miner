import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:dbminer/module/util/utildata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings!.arguments as int;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${category[index]['image']}'),fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        APIHelper.apiHelper.allquotes.clear();
                        Get.offAndToNamed('/');
                      },
                      padding: EdgeInsets.only(top: 30),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: APIHelper.apiHelper.allquotes.length,
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
                              onPressed: () {}, icon: Icon(Icons.favorite))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35,right: 35,top: 10,bottom: 15),
                        child: SingleChildScrollView(
                          child: Text(
                            "${APIHelper.apiHelper.allquotes[index].quote}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Text(" -  ${APIHelper.apiHelper.allquotes[index].author}")
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
