import 'package:flutter/material.dart';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/*
pantalla para ver la lista de todos los comic recientes
*/
class AllComicsRecentScreen extends StatefulWidget {
  final ListAllComicsProvider dataPrv;
  const AllComicsRecentScreen({
    super.key,
    required this.dataPrv,
  });

  @override
  State<AllComicsRecentScreen> createState() => _AllComicsRecentScreenState();
}

class _AllComicsRecentScreenState extends State<AllComicsRecentScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchComics();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (widget.dataPrv.hasMoreComics &&
            !widget.dataPrv.isLoadingMoreComics) {
          widget.dataPrv.loadMoreComics(context); // Utiliza loadMoreComics
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

  void fetchComics({bool loadMore = false}) async {
    await widget.dataPrv
        .getListAllComics(context, loadMore: loadMore); // Corregir el argumento
  }

  Future<void> _onRefresh() async {
    widget.dataPrv.scrollValues();
    await widget.dataPrv.getListAllComics(context, loadMore: false);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final comics = Provider.of<ListAllComicsProvider>(context);

    return ScaffoldUpBlurEffectWidget(
      child: SmartRefresherComponent(
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            const AppBarHomeComponents(title: 'Comics'),
            if (comics.isInitialLoading)
              const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            else
              comics.cachedComics == null || comics.cachedComics!.isEmpty
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
                        itemCount: widget.dataPrv.cachedComics!.length +
                            (widget.dataPrv.hasMoreComics ? 1 : 0),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: size.height * .04),
                        itemBuilder: (context, index) {
                          if (index == widget.dataPrv.cachedComics!.length) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                          final comic = widget.dataPrv.cachedComics?[index];
                          return CardAllComicsAndCharacterComponents(
                            id: comic?.id ?? 0,
                            name: comic?.name.name ?? '',
                            date: comic?.coverDate ?? '',
                            image: comic?.imageUrl ?? '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsComicsScreen(
                                    id: comic?.id ?? 0,
                                    image: comic?.imageUrl ?? '',
                                    name: comic?.name.name ?? '',
                                    date: comic?.coverDate ?? '',
                                    description: comic?.description ?? '',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
