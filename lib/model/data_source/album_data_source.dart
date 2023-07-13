import 'package:http/http.dart' as http;
import '../class/album.dart';
import 'data_source.dart';

class AlbumDataSource implements DataSource {
  @override
  Future<Album> get(http.Client client) async {
    return Album.fromJson(await API.get(client, 'https://jsonplaceholder.typicode.com/albums/1'));
  }
}