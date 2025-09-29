import 'package:dio/dio.dart';

class WordRemoteDatasource {
  final Dio dio = Dio();
  final String baseUrl = "https://random-word-api.herokuapp.com";

  Future<List<String>> getRandomWords(int count) async {
    final response = await dio.get("${baseUrl}/word?number=$count&lang=es");

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      return data.map((w) => w.toString()).toList();
    } else {
      throw Exception("Error at trying to get words from the API");
    }
  }
}
