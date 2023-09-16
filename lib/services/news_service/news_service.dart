import 'package:dio/dio.dart';

class NewsService {
  get() async {
    var response = await Dio().get(
      "NEWSAPI",
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
