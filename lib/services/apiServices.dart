import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiApiService {
  final String apiKey = "AIzaSyC1fqs_A8zuWs9eF79189e4-C9efZyHvTw";

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey",
        ),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {"parts": [{"text": message}]}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        throw Exception("Gemini API Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}