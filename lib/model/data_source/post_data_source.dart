import 'package:http/http.dart' as http;
import '../class/post.dart';
import 'data_source.dart';

class PostDataSource implements DataSource {
  @override
  Future<Post> get(http.Client client) async {
    return Post.fromJson(await API.get(client, 'https://jsonplaceholder.typicode.com/posts/1'));
  }
}