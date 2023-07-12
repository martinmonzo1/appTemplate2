import 'package:app_template/view/home/home_view.dart';
import 'package:app_template/view_model/album_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/data_source/album_data_source.dart';
import './model/repository/album_repository.dart';

void main() {
  final albumDataSource = ApiAlbumDataSource();
  final albumRepository = AlbumRepository(albumDataSource: albumDataSource);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AlbumViewModel>(create: (_) => AlbumViewModel(albumRepository: albumRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Template',
      theme: ThemeData(),
      home: const Home(title: 'Template',)
    );
  }
}
