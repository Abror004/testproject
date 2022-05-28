import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class Network {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "selectpdf.com";
  static String SERVER_PRODUCTION = "selectpdf.com";

  static Map<String, String> getHeaders() {
    Map<String,String> headers = {
      'Content-Type':'multipart/form-data; boundary=---011000010111000001101001'
    };
    return headers;
  }

  static Map<String, String> getUploadHeaders() {
    Map<String, String> headers = {
      'Content-Type':'multipart/form-data; boundary=---011000010111000001101001'
    };
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_DEVELOPMENT;
  }

  static Map<String, dynamic> getBody(String userKey,File file) {
    Map<String, dynamic> params = {};
    params.addAll({
      "key": userKey,
      "uri": file,
    });
    return params;
  }

  /* Http Apis */
  static String API_STRING = "/api2/pdftotext/";

  /* Http Requests */

  static Future<String?> MULTIPART(File file, Map<String, dynamic> body) async {
    var url = Uri.https(getServer(), API_STRING);
    var request = MultipartRequest('POST', url);
    request.headers.addAll(getUploadHeaders());
    request.files.add(await MultipartFile.fromPath(
        'url', file.path,
        contentType: MediaType("Application","pdf"))
    );
    request.fields.addAll({
      "key" : "6ed9b5b2-d54a-4e2e-9b59-de7eda973110",
    },);
    StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("+++++++++++++++++++");
      return await response.stream.bytesToString();
    } else {
      print("-------------------: ${response.statusCode}");
      return response.reasonPhrase;
    }
  }

  /* Http Params */
  static Future<String> paramsLoad(File file) async {
    if(file.path == "assets/file/salom.pdf") {
      return "";
    } else {
      Map<String, dynamic> map = {};
      map.addAll({
        "key" : "b2815f0c-11e8-4b22-af6d-1114958b2e23",
        "url" : file,
      });
      String? result = await MULTIPART(file, map);
      if(result == null) {
        return "";
      }
      return result;
    }
  }
}