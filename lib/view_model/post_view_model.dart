import '../model/class/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/repository/post_repository.dart';

class PostViewModel with ChangeNotifier {

  final PostRepository postRepository;
  final http.Client client = http.Client();

  PostViewModel({required this.postRepository});

  Post? _post;
  Post? get post => _post;

  Future<void> getPost() async {
    try {
      Post response = await postRepository.getPost(client);
      _post = response;
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}