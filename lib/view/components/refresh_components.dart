import 'package:animate_do/animate_do.dart';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/*
import 'package:flutter/material.dart';
componente para manejar el scroll de la app
*/

class SmartRefresherComponent extends StatelessWidget {
  final Function() onRefresh;
  final RefreshController refreshController;
  final Widget child;
  const SmartRefresherComponent({
    super.key,
    required this.onRefresh,
    required this.refreshController,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RefreshConfiguration(
      child: SmartRefresher(
        controller: refreshController,
        // enablePullDown: true,
        enablePullUp: false,
        onRefresh: onRefresh,
        physics: const BouncingScrollPhysics(),
        header: BezierHeader(
          bezierColor: PaletteColorsTheme.redColor.withOpacity(0.05),
          rectHeight: size.height * .14,
          child: Align(
            alignment: Alignment.topCenter,
            child: FadeIn(
              duration: const Duration(seconds: 2),
              child: const Center(),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
