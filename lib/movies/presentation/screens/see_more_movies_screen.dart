import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utilis/app_strings.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_state.dart';
import '../../../core/services/service_locator.dart';
import '../components/see_more_list_view_item.dart';

class SeeMoreMoviesScreen extends StatelessWidget {
  final String appBartTitle;
  const SeeMoreMoviesScreen({super.key, required this.appBartTitle});

  @override
  Widget build(BuildContext context) {
    List<MovieEntity> item;
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetPopularMoviesEvents())
        ..add(GetTopRatedMoviesEvents()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (appBartTitle == Appstrings.topRated) {
            item = state.topRatedMovies;
          } else {
            item = state.popularMovies;
          }
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text(appBartTitle),
              centerTitle: true,
            ),
            body: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final movie = item[index];
                  return SeeMoreListViewItem(
                    date: movie.realseDate,
                    image: movie.backDropPath,
                    title: movie.title,
                    overView: movie.overView,
                    voteAverage: movie.voteAvarage,
                    id: movie.id,
                  );
                }),
          ));
        },
      ),
    );
  }
}
