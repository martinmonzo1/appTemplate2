import '../class/album.dart';
import '../data_source/album_data_source.dart';
import 'package:http/http.dart' as http;

class AlbumRepository {

  final AlbumDataSource albumDataSource;

  AlbumRepository({required this.albumDataSource});

  Future<Album> getAlbum(http.Client client) {
    return albumDataSource.get(client);
  }
}