import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DiscoverProvider provider = context.watch<DiscoverProvider>();
    // Other form for watch:
    // final otherProvider = Provider.of<DiscoverProvider>(context);
    // Other form for read:
    // final otherProvider = Provider.of<DiscoverProvider>(context, listen: false);
    return Scaffold(
      body: provider.initialLoadinbg
          ? const Center(
              child: CircularProgressIndicator(
              strokeWidth: 2,
            ))
          : VideoScrollableView(videos: provider.videos),
    );
  }
}
