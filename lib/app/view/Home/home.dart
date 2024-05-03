import 'package:Formus/app/components/button/button.dart';
import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/components/text/headline/headline.dart';
import 'package:Formus/app/style/app_colors.dart';
import 'package:Formus/app/view/Home/components/movie_component.dart';
import 'package:Formus/app/view/Home/home_controlller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (value) {
          return SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(
                title: Headline.medium(
                  text: "Formus Teste",
                  color: FormusColors.theme.neutral.white,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Get.toNamed(
                        '/search',
                      );
                    },
                  ), //IconButton
                ], //<Widget>[]
                backgroundColor: FormusColors.theme.blue.medium,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              body: Center(
                child: value.isLoading
                    ? Body.bold(text: 'carregando')
                    : CustomScrollView(
                        primary: false,
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.all(10.0),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 10.0,
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              children: <Widget>[
                                ...value.movies.map(
                                  (e) => MovieComponent(
                                    id: e.id!,
                                    image: e.posterPath!,
                                    title: e.originalTitle!,
                                    date: e.releaseDate!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8),
                            sliver: SliverList.list(
                              children: [
                                FormusButton(
                                  text: 'Carregar mais',
                                  isLoading: value.loadingMore,
                                  onPress: () => value.loadMoreMovies(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
              ),
            ),
          );
        });
  }
}
