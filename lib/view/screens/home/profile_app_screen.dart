import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

class ProfileAppScreen extends StatelessWidget {
  const ProfileAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const AppBarHomeComponents(title: ''),
          SliverList(
              delegate: SliverChildListDelegate([
            Image.network(
                'https://i0.wp.com/www.tomosygrapas.com/wp-content/uploads/2022/10/superman-banner.jpg?resize=747%2C421&ssl=1'),
            Image.network(
                'https://i0.wp.com/www.tomosygrapas.com/wp-content/uploads/2022/10/superman-banner.jpg?resize=747%2C421&ssl=1'),
            Image.network(
                'https://i0.wp.com/www.tomosygrapas.com/wp-content/uploads/2022/10/superman-banner.jpg?resize=747%2C421&ssl=1'),
          ])),
        ],
      ),
    );
  }
}
