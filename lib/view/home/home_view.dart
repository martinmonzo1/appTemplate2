import 'package:app_template/view_model/album_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/class/album.dart';

class Home extends StatefulWidget {

  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    context.read<AlbumViewModel>().getAlbum();
  }

  @override
  Widget build(BuildContext context) {

    final Album? album = context.watch<AlbumViewModel>().album;

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: (album != null)
            ? Text(album.title)
            : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}