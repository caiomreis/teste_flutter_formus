import 'package:Formus/app/components/button/button.dart';
import 'package:Formus/app/components/input/formus_input_base.dart';
import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/style/app_colors.dart';
import 'package:Formus/app/view/Home/components/movie_component.dart';
import 'package:Formus/app/view/Search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GetBuilder(
          init: SearchPageController(),
          builder: (value) {
            return Scaffold(
              appBar: AppBar(
                title: FormusInputBase(
                  keyboardType: TextInputType.text,
                  onChange: (String val) {
                    value.name = val;
                  },
                  onSubmit: () {
                    value.getSearchMovie();
                  },
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      value.getSearchMovie();
                    },
                  ),
                  placeholder: 'Procure um filme',
                  textController: value.textEditingController,
                ), //IconButton
                toolbarHeight: 60,
                backgroundColor: FormusColors.theme.blue.medium,

                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              body: Center(
                child: CustomScrollView(
                  primary: false,
                  slivers: [
                    if (value.movies.isNotEmpty && !value.isLoading)
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
                                image: e.posterPath,
                                title: e.originalTitle!,
                                date: e.releaseDate!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (value.movies.isNotEmpty && !value.isLoading)
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
                      ),
                    if (value.movies.isEmpty)
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8),
                        sliver: SliverList.list(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top -
                                  100,
                              width: MediaQuery.of(context).size.width,
                              child: Body.bold(
                                  text: value.isLoading
                                      ? 'Carregando'
                                      : 'Digite o que deseja procurar!'),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
