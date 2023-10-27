import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoadinbg = true;
  List<VideoPost> videos = [];

  //todo: load videos from diferent source.

  Future<void> loadNextPage() async {
    notifyListeners();
  }
}
