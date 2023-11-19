import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        //TapBotton Main
        GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
            },
            //Define internal route for the "main view"
            routes: [
              GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';

                  return MovieScreen(movieId: movieId);
                },
              ),
            ]),
  
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
      ]),

// Routes father/child
  // GoRoute(
  //     path: '/',
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(childView: FavoritesView(),),
  //     routes: [
  //       GoRoute(
  //          path: 'movie/:id',
  //           name: MovieScreen.name,
  //           builder: (context, state) {
  //             //How to get the parameter:
  //             final movieId = state.pathParameters['id'] ?? 'no-id';
  //             return MovieScreen(
  //               movieId: movieId,
  //             );
  //           }),
  //     ]),
]);
