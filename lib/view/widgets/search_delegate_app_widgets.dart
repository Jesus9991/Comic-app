// ignore_for_file: use_build_context_synchronously

import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

/*
buscador para toda la app
*/
class SearchDelegateAppWidgets extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscador';
  @override
  TextStyle? get searchFieldStyle => FontsTypeTheme.typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.secondary);

  @override
  List<Widget>? buildActions(BuildContext context) {
    final cleanPv = Provider.of<SearchAppProvider>(context);
    if (query.isNotEmpty) {
      return [
        IconButton(
            icon: const Icon(Iconsax.trash_outline),
            onPressed: () {
              /*elimina lo buscador */
              query = '';
              cleanPv.cleanSuggestions();
            }).animate().fade(duration: 300.ms, curve: Curves.bounceIn).scale()
      ];
    } else {
      return [];
    }
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return GradientContainer(
      child: SearchContainerComponents(
        query: query,
      ),
    );
  }

  @override
  /*sugerencias */
  @override
  Widget buildSuggestions(BuildContext context) {
    final searchProvider = Provider.of<SearchAppProvider>(context);

    /*actualiza las sugerencias cuando el query cambia */
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (query.isNotEmpty) {
        searchProvider.fetchSuggestions(query);
      }
    });

    return GradientContainer(
      child: Consumer<SearchAppProvider>(
        builder: (context, suggPrv, child) {
          if (query.isEmpty) {
            return const IsEmptyComponents(
              title: 'Ingrese un término de búsqueda.',
            );
          } else {
            if (suggPrv.suggestions.isEmpty) {
              return const IsEmptyComponents(
                title: 'No se obtuvieron resultados.',
              );
            } else {
              return ListView.builder(
                itemCount: suggPrv.suggestions.length,
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index) {
                  return SugerestionResultComponents(
                    query: query,
                    name: suggPrv.suggestions[index],
                    onTap: () async {
                      /*actualiza el query con la sugerencia seleccionada */
                      query = suggPrv.suggestions[index];
                      /*busca los personajes usando el nuevo query */
                      suggPrv.cleanResults();
                      /*nuestra los resultados */
                      showResults(context);
                      await suggPrv.searchCharacters(query);
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: PaletteColorsTheme.transparent,
        elevation: 0,
        iconTheme: theme.iconTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: searchFieldStyle,
          ),
    );
  }
}

class SearchContainerComponents extends StatefulWidget {
  final String query;
  const SearchContainerComponents({
    super.key,
    required this.query,
  });

  @override
  createState() => _SearchContainerComponentsState();
}

class _SearchContainerComponentsState extends State<SearchContainerComponents> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data when reaching the end of the list
      final searchPrv = Provider.of<SearchAppProvider>(context, listen: false);
      if (!searchPrv.isLoading && !searchPrv.hasReachedMax) {
        searchPrv.loadMoreCharacters();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchAppProvider>(
      builder: (context, searchPrv, child) {
        if (searchPrv.isLoading && searchPrv.characters.isEmpty) {
          return const LoadingAppComponents();
        } else if (searchPrv.characters.isEmpty) {
          return IsEmptyComponents(
            title: 'No se encontraron resultados para: ${widget.query}',
          );
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount:
                searchPrv.characters.length + (searchPrv.hasReachedMax ? 0 : 1),
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              if (index >= searchPrv.characters.length) {
                // Loading more indicator
                return const Center(child: LoadingAppComponents());
              }
              final data = searchPrv.characters[index];
              return ResultSearchComponents(
                name: data.name ?? '',
                realName: data.realName ?? '',
                image: data.imageUrl ?? '',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsCharacterScreen(
                        image: data.imageUrl ?? '',
                        id: data.id,
                        name: data.name ?? '',
                        dateTime: data.birth ?? '',
                        aliases: data.aliases ?? '',
                        description: data.description ?? '',
                        origin: data.origin?.name ?? '',
                        realName: data.realName ?? '',
                        punisher: data.publisher?.name ?? '',
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
