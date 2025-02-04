```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomNetworkError implements Exception {
  final String message;
  CustomNetworkError(this.message);
  @override
  String toString() => message;
}

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw CustomNetworkError('Request failed with status: ${response.statusCode}. Response body: ${response.body}');
    }
  } on http.ClientException catch (e) {
    throw CustomNetworkError('Network error: $e');
  } on FormatException catch (e) {
    throw CustomNetworkError('JSON format error: $e');
  } catch (e) {
    throw CustomNetworkError('An unexpected error occurred: $e');
  }
}
```