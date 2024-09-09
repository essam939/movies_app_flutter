import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/network/api_constance.dart';
import 'package:movieapp/core/services/injection.dart';
import 'package:movieapp/core/utilis/enums.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movieapp/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final MoviesBloc moviesBloc;
  SearchScreen({super.key, required this.moviesBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter movie name',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                if (text.isNotEmpty) {
                  moviesBloc.add(SearchOnMovieEvent(movieName: text));
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<MoviesBloc, MoviesState>(
                bloc: moviesBloc,
                builder: (context, state) {
                  switch (state.searchState) {
                    case RequestState.loading:
                      return const SizedBox();
                    case RequestState.loaded:
                      return ListView.builder(
                        itemCount: state.searchMovies.length,
                        itemBuilder: (context, index) {
                          final movie = state.searchMovies[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movie: movie)));
                            },
                            leading: Hero(
                              tag: movie.id,
                              child: CachedNetworkImage(
                                width: 120.0,
                                fit: BoxFit.cover,
                                imageUrl:
                                    ApiConstance.imageUrl(movie.backdropPath),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            title: Text(movie.title),
                            subtitle: Text(movie.releaseDate),
                          );
                        },
                      );

                    case RequestState.error:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
