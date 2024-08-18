// Modelo principal para los personajes
import 'package:comic_app/controller/exports/exports.dart';

class ListCharactersHomeModel {
  final int id;
  final String name;
  final String aliases;
  final String description;
  final ImageModelCharacter image;
  final OriginModelCharacter origin;
  final PublisherModelCharacter publisher;
  final String realName;
  final String dateTime;

  ListCharactersHomeModel({
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
  factory ListCharactersHomeModel.fromJson(Map<String, dynamic> json) {
    return ListCharactersHomeModel(
      id: json["id"] ?? 0,
      aliases: json['aliases'] ?? '',
      description: DeleteHttmlTags.removeHtmlTags(json['description'] ?? ''),
      image: json['image'] != null
          ? ImageModelCharacter.fromJson(json['image'])
          : ImageModelCharacter(image: ''),
      name: json['name'] ?? '',
      origin: json['origin'] != null
          ? OriginModelCharacter.fromJson(json['origin'])
          : OriginModelCharacter(name: '', id: 0),
      publisher: json['publisher'] != null
          ? PublisherModelCharacter.fromJson(json['publisher'])
          : PublisherModelCharacter(name: '', id: 0),
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
class ImageModelCharacter {
  final String image;

  ImageModelCharacter({
    required this.image,
  });

  factory ImageModelCharacter.fromJson(Map<String, dynamic> json) {
    return ImageModelCharacter(
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
class OriginModelCharacter {
  final String name;
  final int id;

  OriginModelCharacter({
    required this.name,
    required this.id,
  });

  factory OriginModelCharacter.fromJson(Map<String, dynamic> json) {
    return OriginModelCharacter(
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
class PublisherModelCharacter {
  final String name;
  final int id;

  PublisherModelCharacter({
    required this.name,
    required this.id,
  });

  factory PublisherModelCharacter.fromJson(Map<String, dynamic> json) {
    return PublisherModelCharacter(
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
