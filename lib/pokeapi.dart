import 'package:http/http.dart' as http;

const baseUrl = 'https://api-pokemon-fr.vercel.app/api/v1';

Future<void> test() async {
  final http.Response response =
      await http.get(Uri.parse("${baseUrl}/pokemon"), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });
  print(response.statusCode);
  print(response.body);
}
