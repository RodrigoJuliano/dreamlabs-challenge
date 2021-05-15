import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostsApi {
  static const BASE_URL = 'jsonplaceholder.typicode.com';
  static const POSTS = '/posts';

  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.https(BASE_URL, POSTS));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Iterable l = json.decode(response.body);
        return List<Post>.from(l.map((model) => Post.fromJson(model)));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Não foi possível carregar os dados');
      }
    } catch (_) {
      throw Exception('Não foi possível conectar com o servidor');
    }
  }

  PostsApi._();
}
