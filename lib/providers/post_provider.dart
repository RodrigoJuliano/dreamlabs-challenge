import 'package:flutter/material.dart';
import '../models/post.dart';
import '../apis/posts_api.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = <Post>[];

  List<Post> get postList => _posts;

  set postList(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  void clearPostList() {
    _posts = <Post>[];
    notifyListeners();
  }

  Future fetchPosts() async {
    _posts = await PostsApi.fetchPosts();
    notifyListeners();
  }
}
