import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // This prop changes the page to vertical and changes the behiavor.
      scrollDirection: Axis.vertical,
      // This prop change the behiavor the end of page like bounce the sceen.
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            //Video Player + gradiant
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            // Bottons
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}

// Notes:
/*
  this case render all children on memory for this example only have 7 items,
  but imagine having 100, or 1000, however only need the prev, current and the next

  For this reason exist PageView.builder, build on demand

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
*/