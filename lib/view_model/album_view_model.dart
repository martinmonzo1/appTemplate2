import '../model/repository/album_repository.dart';
import 'package:flutter/material.dart';
import '../model/class/album.dart';
import 'package:http/http.dart' as http;

class AlbumViewModel with ChangeNotifier {
  
  final AlbumRepository albumRepository;
  final http.Client client = http.Client();
  
  AlbumViewModel({required this.albumRepository});

  Album? _album;
  Album? get album => _album;

  Future<void> getAlbum() async {
    try {
      Album response = await albumRepository.getAlbum(client);
      _album = response;
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}