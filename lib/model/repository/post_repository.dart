import '../class/post.dart';
import 'package:http/http.dart' as http;

import '../data_source/post_data_source.dart';

class PostRepository {

  final PostDataSource postDataSource;

  PostRepository({required this.postDataSource});

  Future<Post> getPost(http.Client client) {
    return postDataSource.get(client);
  }
}