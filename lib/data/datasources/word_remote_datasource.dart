import 'package:dio/dio.dart';

class WordRemoteDatasource {
  final Dio dio = Dio();
  final String baseUrl = "https://proxy-systems-info.vercel.app";

  Future<List<String>> getRandomWords(int count) async {
    try {
      final response = await dio.get("$baseUrl/api/words?number=$count");

      if (response.statusCode == 200) {
        final data = response.data;

        // Aseguramos que sea lista
        if (data is List) {
          return data.map((w) => w.toString()).toList();
        } else {
          throw Exception("Unexpected response format: $data");
        }
      } else {
        throw Exception("Error at trying to get words from proxy API");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
