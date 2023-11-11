import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Define the provider for the actors.
final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

//Define the callback for the get actors by movie.
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

/*
This class repesents a state notifier of movidId, List<Actor>  like this:
  {
    '505642': <Actor>[],
    '505643': <Actor>[],
    '505645': <Actor>[],
    '501231': <Actor>[],
  }
*/
class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    // Validation if exist into state no call the api again.
    if (state[movieId] != null) return;
   // Get the actors call the api
    final List<Actor> actors = await getActors(movieId);
    // Update the state
    state = {...state, movieId: actors};
  }
}
