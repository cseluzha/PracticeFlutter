import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.teal,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
