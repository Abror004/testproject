import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:soundtest/service/pdftotext_service.dart';


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

  String text = "";
  File? file;
  bool isLoading = false;
  bool ethernet = true;

  void loadText() async {
        isLoading = true;
        bool hasFile = await openPDF();
        print("+++++++++>>> pdf olindi: $hasFile");
        if(hasFile) {
          try{
            text = await Network.paramsLoad(file!);
            ethernet = true;
          } on  SocketException catch (e) {
            print("no ethernet: ${e}");
            ethernet = false;
          }
        }
        print("&&&&: ${text}");
        setState(() {
          isLoading = false;
        });
        file = null;
        print("++++++++++++++++++= tugadi +++++++++++++++");
  }

  Future<bool> openPDF() async {
    print(".");
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print("..");
    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });
      print("...true");
      return true;
    }
    print("...false");
    return false;
  }

  void checkEthernet() async {
      try {
        await Network.paramsLoad(File("assets/file/salom.pdf"));
      } on  SocketException catch (e) {
        ethernet = false;
      }
      ethernet = true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    checkEthernet();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  checkEthernet();
                  loadText();
                },
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
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: () {
                  setState(() {
                    text = "";
                  });
                },
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
              Divider(
                color: Colors.black,
              ),
              ethernet ? isLoading ? Center(child: CircularProgressIndicator(),)
                  : textWidget()
                  : Column(
                children: [
                  Text("No Ethernet"),
                  SizedBox(height: 10,),
                  Icon(Icons.signal_wifi_off,color: Colors.red,size: 50,),
                ],)
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget() {
    return Text(text, style: TextStyle(color: Colors.black),);
  }
}
