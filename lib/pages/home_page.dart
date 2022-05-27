import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  // List list = ["assets/file/abror.txt","assets/file/flutter.txt","assets/file/info.txt"];
  // String a = "";
  //
  //
  //
  // void sssss (int s) async {
  //   a = await rootBundle.loadString(list[s]);
  // }
  //
  // Future<String> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('assets/$path');
  //   final file = File('${(await getTemporaryDirectory()).path}/$path');
  //   await file.create();
  //   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //   String a = await rootBundle.loadString(file.path);
  //   return a;
  // }
  //
  // void clear() {
  //   a = "";
  // }
  List list = ["assets/file/abror.pdf"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("",style: TextStyle(fontSize: 20),),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 50,
                      width: 100,
                      child: ColoredBox(
                        color: Colors.green,
                        child: Center(
                          child: Text("load file"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: ColoredBox(
                        color: Colors.green,
                        child: Center(
                          child: Text("clear"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
