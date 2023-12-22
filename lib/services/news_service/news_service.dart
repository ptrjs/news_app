// import 'package:dio/dio.dart';

// class NewsService {

//   get() async {
//     var response = await Dio().get(
//       "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4e764de911fd49bdb528c3b6919ef67e",
//       options: Options(
//         headers: {
//           "Content-Type": "application/json",
//         },
//       ),
//     );
//     Map obj = response.data;
//     return obj["articles"];
//   }
// }

import 'package:dio/dio.dart';

class NewsService {
  get() async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4e764de911fd49bdb528c3b6919ef67e",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["articles"];
  }
}
