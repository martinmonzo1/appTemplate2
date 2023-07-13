import 'package:app_template/view_model/album_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/class/album.dart';
import '../../model/class/post.dart';
import '../../view_model/post_view_model.dart';

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
    context.read<PostViewModel>().getPost();
  }

  @override
  Widget build(BuildContext context) {

    final Album? album = context.watch<AlbumViewModel>().album;
    final Post? post = context.watch<PostViewModel>().post;

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
          child: Column(
            children: [
              (album != null)
                  ? Text(album.title)
                  : const CircularProgressIndicator(),
              const SizedBox(height: 100.0,),
              (post != null)
                  ? Text(post.title)
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}