import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

class CharactersAppScreen extends StatelessWidget {
  const CharactersAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          AppBarHomeComponents(),
          SliverList(
              delegate: SliverChildListDelegate([
            Image.network(
                'https://i.pinimg.com/736x/c5/5c/dc/c55cdca9d7684c8cf07079752e6d3350.jpg'),
            Image.network(
                'https://i.pinimg.com/736x/c5/5c/dc/c55cdca9d7684c8cf07079752e6d3350.jpg'),
            Image.network(
                'https://i.pinimg.com/736x/c5/5c/dc/c55cdca9d7684c8cf07079752e6d3350.jpg'),
          ])),
        ],
      ),
    );
  }
}
