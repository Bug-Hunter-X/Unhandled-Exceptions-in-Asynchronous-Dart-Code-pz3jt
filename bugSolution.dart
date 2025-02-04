```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Use the data
    } else {
      // Specific error handling for different status codes
      if (response.statusCode == 404) {
        throw Exception('Resource not found');
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }
  } on SocketException catch (e) {
    // Handle network errors
    print('Network error: $e');
    // Implement retry logic here if needed
  } on FormatException catch (e) {
    // Handle JSON parsing errors
    print('JSON parsing error: $e');
  } catch (e) {
    // Handle other exceptions
    print('Unexpected error: $e');
    // Consider logging error details for debugging
  }
}
```