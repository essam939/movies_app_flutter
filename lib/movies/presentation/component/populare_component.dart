import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/network/api_constance.dart';
import 'package:movieapp/core/utilis/enums.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movieapp/movies/presentation/screens/movie_detail_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shimmer/shimmer.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.populareState != current.populareState,
        builder: (context, state) {
          switch (state.populareState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());

            case RequestState.loaded:
              return ResponsiveGridView.builder(
                physics:const BouncingScrollPhysics(),
            gridDelegate: const ResponsiveGridDelegate(
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              maxCrossAxisExtent: 200,
            ),   
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.populareMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.populareMovies[index];
                  return FadeIn(
                    child: Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(movie: movie)));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: Hero(
                            tag: movie.id,
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                              placeholder: (context, url) => Shimmer.fromColors(
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
                        ),
                      ),
                    ),
                  );
                },
              );

            case RequestState.error:
              return Container();
          }
        });
  }
}
