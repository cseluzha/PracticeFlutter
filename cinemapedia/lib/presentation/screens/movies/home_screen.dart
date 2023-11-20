import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/views/views.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// addd mixin (AutomaticKeepAliveClientMixin) for keep the state of a page view.
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

// List of Widgets for the taps into TabBottomNavigator
  final viewRoutes = const <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Validate has pages and add animation.
    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
      //Now changes for:
      body: PageView(
        //* This will prevent it from bouncing
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex,
      ),
    );
    // The widget IndexedStact persist the state for the current widget.
    //   body: IndexedStack(
    //     index: widget.pageIndex,
    //     children: viewRoutes,
    //   ),
    //   bottomNavigationBar:
    //       CustomBottomNavigation(currentIndex: widget.pageIndex),
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
