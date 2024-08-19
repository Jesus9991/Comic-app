import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
componente para menejar datos vacios
*/
class IsEmptyComponents extends StatelessWidget {
  final String title;
  final IconData? icon;
  const IsEmptyComponents({
    super.key,
    required this.title,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Iconsax.search_status_outline,
            size: 45,
          ),
          SizedBox(height: size.height * .02),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
