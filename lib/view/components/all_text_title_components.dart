import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

/*
componentes para los titulos que dicen ej. comics- ver todos
*/
class AllTextTitleComponents extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function onTap;
  const AllTextTitleComponents({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * .05),
        leading: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => onTap(),
          child: Text(
            subtitle ?? 'Ver todos',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
