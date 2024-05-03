import 'package:Formus/app/components/formus_cached_image.dart';
import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/components/text/headline/headline.dart';
import 'package:Formus/app/components/text/label/label.dart';
import 'package:Formus/app/style/app_colors.dart';
import 'package:Formus/app/view/MovieDetail/movie_detail_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GetBuilder(
        init: MovieDetailController(),
        builder: (value) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: FormusColors.theme.blue.medium,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  if (value.isLoading && value.loadingCast)
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            FormusColors.theme.blue.strong,
                            BlendMode.color,
                          ),
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${value.movie.backdropPath ?? value.movie.posterPath}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (!value.isLoading && !value.loadingCast)
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        top: 60,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            fit: StackFit.passthrough,
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              FormusCachedImage(
                                heigth: 280,
                                width: 200,
                                label: value.movie.title,
                                imageUrl:
                                    'https://image.tmdb.org/t/p/original/${value.movie.posterPath}',
                              ),
                              Positioned(
                                left: 70,
                                bottom: 10,
                                child: average(value.movie.voteAverage!),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Headline.bold(text: value.movie.title!),
                          const SizedBox(
                            height: 12,
                          ),
                          Body.medium(text: value.movie.overview!),
                          const SizedBox(
                            height: 24,
                          ),
                          Headline.bold(
                            text: 'Cast',
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.5,
                              height: 270,
                            ),
                            items: value.cast.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Column(children: [
                                    FormusCachedImage(
                                      heigth: 200,
                                      width: 150,
                                      label: i.name!,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/original/${i.profilePath}',
                                    ),
                                    const SizedBox(height: 12),
                                    Center(
                                        child: Label.bold(
                                            text: 'Nome: ${i.name!}')),
                                    const SizedBox(height: 4),
                                    Center(
                                      child: Label.bold(
                                        text: 'Personagem: ${i.character!}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]);
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  average(double value) {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: FormusColors.theme.blue.medium,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Headline.bold(
        text: value.toStringAsFixed(2),
        color: FormusColors.theme.neutral.white,
      ),
    );
  }
}
