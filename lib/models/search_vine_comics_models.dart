/*
modelo para manejar el buscador de la app
*/
import 'package:comic_app/controller/exports/exports.dart';

class SearchComicVine {
  final int id;
  final String? aliases;
  final String? birth;
  final String? description;
  final String? imageUrl;
  final String? name;
  final String? realName;
  final OriginComicVine? origin;
  final PublisherComicVine? publisher;

  SearchComicVine({
    required this.id,
    this.aliases,
    this.birth,
    this.description,
    this.imageUrl,
    this.name,
    this.realName,
    this.origin,
    this.publisher,
  });

  factory SearchComicVine.fromJson(Map<String, dynamic> json) {
    return SearchComicVine(
      id: json['id'] as int,
      aliases: json['aliases'] as String?,
      birth: json['birth'] as String?,
      description:
          DeleteHttmlTags.removeHtmlTags(json['description'] ?? '') as String?,
      imageUrl: json['image']['medium_url'] as String?,
      name: json['name'] as String?,
      realName: json['real_name'] as String?,
      origin: json['origin'] != null
          ? OriginComicVine.fromJson(json['origin'])
          : null,
      publisher: json['publisher'] != null
          ? PublisherComicVine.fromJson(json['publisher'])
          : null,
    );
  }
}

class OriginComicVine {
  final int id;
  final String name;

  OriginComicVine({
    required this.id,
    required this.name,
  });

  factory OriginComicVine.fromJson(Map<String, dynamic> json) {
    return OriginComicVine(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class PublisherComicVine {
  final int id;
  final String name;

  PublisherComicVine({
    required this.id,
    required this.name,
  });

  factory PublisherComicVine.fromJson(Map<String, dynamic> json) {
    return PublisherComicVine(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
