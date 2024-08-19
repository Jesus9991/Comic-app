import 'package:comic_app/controller/exports/exports.dart';
/*
modelo para obtener todos los personajes
*/

class ListCharactersAllModel {
  final int id;
  final String name;
  final String aliases;
  final String description;
  final ImageModelCharacterAll image;
  final OriginModelCharacterAll origin;
  final PublisherModelCharacterAll publisher;
  final String realName;
  final String dateTime;

  ListCharactersAllModel({
    required this.id,
    required this.aliases,
    required this.description,
    required this.image,
    required this.name,
    required this.origin,
    required this.publisher,
    required this.realName,
    required this.dateTime,
  });

  // metodo para convertir JSON a un objeto de ListCharactersHomeModel
  factory ListCharactersAllModel.fromJson(Map<String, dynamic> json) {
    return ListCharactersAllModel(
      id: json["id"] ?? 0,
      aliases: json['aliases'] ?? '',
      description: DeleteHttmlTags.removeHtmlTags(json['description'] ?? ''),
      image: json['image'] != null
          ? ImageModelCharacterAll.fromJson(json['image'])
          : ImageModelCharacterAll(image: ''),
      name: json['name'] ?? '',
      origin: json['origin'] != null
          ? OriginModelCharacterAll.fromJson(json['origin'])
          : OriginModelCharacterAll(name: '', id: 0),
      publisher: json['publisher'] != null
          ? PublisherModelCharacterAll.fromJson(json['publisher'])
          : PublisherModelCharacterAll(name: '', id: 0),
      realName: json['real_name'] ?? '',
      dateTime: json['date_added'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aliases': aliases,
      'description': description,
      'image': image.toJson(),
      'name': name,
      'origin': origin.toJson(),
      'publisher': publisher.toJson(),
      'real_name': realName,
      'date_added': dateTime,
    };
  }
}

//modelo para la imagen del personaje
class ImageModelCharacterAll {
  final String image;

  ImageModelCharacterAll({
    required this.image,
  });

  factory ImageModelCharacterAll.fromJson(Map<String, dynamic> json) {
    return ImageModelCharacterAll(
      image: json['medium_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medium_url': image,
    };
  }
}

//modelo para el origen del personaje
class OriginModelCharacterAll {
  final String name;
  final int id;

  OriginModelCharacterAll({
    required this.name,
    required this.id,
  });

  factory OriginModelCharacterAll.fromJson(Map<String, dynamic> json) {
    return OriginModelCharacterAll(
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}

// modelo para el publisher del personaje
class PublisherModelCharacterAll {
  final String name;
  final int id;

  PublisherModelCharacterAll({
    required this.name,
    required this.id,
  });

  factory PublisherModelCharacterAll.fromJson(Map<String, dynamic> json) {
    return PublisherModelCharacterAll(
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
