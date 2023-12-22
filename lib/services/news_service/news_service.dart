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
  // Define a constant for the API URL and your API key
  static const String _baseUrl = "https://newsapi.org/v2/top-headlines";
  static const String _apiKey = "API-KEY"; // Replace with your actual API key

  // Fetch news articles
  Future<List<dynamic>> get() async {
    try {
      // Construct the complete URL with query parameters
      String url = '$_baseUrl?country=us&category=business&apiKey=$_apiKey';

      // Make the GET request using Dio
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      // Check if the response status code is successful (status code 200)
      if (response.statusCode == 200) {
        // Extract the "articles" field from the response data
        Map<String, dynamic> data = response.data;
        return data["articles"];
      } else {
        // Handle non-successful status codes
        print('Request failed with status: ${response.statusCode}');
        return []; // or throw an exception
      }
    } catch (error) {
      // Handle DioException or other errors
      print('Error in NewsService: $error');
      return []; // or throw an exception
    }
  }
}
