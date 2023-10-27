import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // todo: Repository, DataSource

  bool initialLoadinbg = true;
  List<VideoPost> videos = [];

  //todo: load videos from diferent sources.

  Future<void> loadNextPage() async {
    // simulation call to api
    await Future.delayed(const Duration(seconds: 2));

    // todo: load videos

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoadinbg = false;
    notifyListeners();
  }
}
