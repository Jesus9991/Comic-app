import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/*
pantalla para ver la lista de todos los personajes
*/
class AllCharactersScreen extends StatefulWidget {
  final ListAllCharacterProviders dataPrv;
  const AllCharactersScreen({
    super.key,
    required this.dataPrv,
  });

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchComics();
    /*al hacer scroll obtiene más datos */
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (widget.dataPrv.hasMore && !widget.dataPrv.isLoadingMore) {
          widget.dataPrv.loadMoreComics(context);
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  /*petición para obtener los datos de entrada */
  void fetchComics({bool loadMore = false}) async {
    await widget.dataPrv.getListCharactersAll(loadMore: loadMore);
  }

  /*función para refrescar la pantalla con nuevos datos*/
  Future<void> onRefresh() async {
    widget.dataPrv.scrollValues();
    await widget.dataPrv.getListCharactersAll(loadMore: false);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heroPrv = Provider.of<ListAllCharacterProviders>(context);
    return ScaffoldUpBlurEffectWidget(
      child: SmartRefresherComponent(
        refreshController: _refreshController,
        onRefresh: onRefresh,
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            const AppBarHomeComponents(title: ''),
            if (heroPrv.isInitialLoading)
              const ShimmerAllListComponents()
            else
              heroPrv.cachedHeros == null || heroPrv.cachedHeros!.isEmpty
                  ? const SliverToBoxAdapter(
                      child: IsEmptyComponents(
                        icon: Iconsax.document_1_outline,
                        title: 'No se encontraron comics disponibles.',
                      ),
                    )
                  : SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .03),
                      sliver: SliverList.separated(
                        itemCount: heroPrv.cachedHeros!.length +
                            (widget.dataPrv.hasMore ? 1 : 0),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: size.height * .04),
                        itemBuilder: (context, index) {
                          if (index == heroPrv.cachedHeros!.length) {
                            return const LoadingAppComponents();
                          }
                          final hero = heroPrv.cachedHeros?[index];

                          return CardAllComicsAndCharacterComponents(
                            id: hero?.id ?? 0,
                            name: hero?.name ?? '',
                            date: hero?.dateTime ?? '',
                            image: hero?.image.image ?? '',
                            onTap: () {
                              /*navega ver los detalles del comic*/
                              /*navega a los detalles del personajes*/
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsCharacterScreen(
                                    image: hero?.image.image ?? '',
                                    id: hero?.id ?? 0,
                                    name: hero?.name ?? '',
                                    dateTime: hero?.dateTime ?? '',
                                    aliases: hero?.aliases ?? '',
                                    description: hero?.description ?? '',
                                    origin: hero?.origin.name ?? '',
                                    realName: hero?.realName ?? '',
                                    punisher: hero?.publisher.name ?? '',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
