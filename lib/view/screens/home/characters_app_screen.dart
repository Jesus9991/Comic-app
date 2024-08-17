import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

class CharactersAppScreen extends StatelessWidget {
  const CharactersAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const ScaffoldUpBlurEffectWidget(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          AppBarHomeComponents(title: ''),
          //personajes principales
          ListPrincipalCharactersComponents(),
        ],
      ),
    );
  }
}
