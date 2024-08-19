import 'package:comic_app/controller/exports/exports.dart';
/*
modelo para obtener los personajes enumerados
*/

class ListCharactersNumberModel {
  final int id;
  final String name;
  final String aliases;
  final String description;
  final ImageModelCharacterNumber image;
  final OriginModelCharacterNumber origin;
  final PublisherModelCharacterNumber publisher;
  final String realName;
  final String dateTime;

  ListCharactersNumberModel({
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
  factory ListCharactersNumberModel.fromJson(Map<String, dynamic> json) {
    return ListCharactersNumberModel(
      id: json["id"] ?? 0,
      aliases: json['aliases'] ?? '',
      description: DeleteHttmlTags.removeHtmlTags(json['description'] ?? ''),
      image: json['image'] != null
          ? ImageModelCharacterNumber.fromJson(json['image'])
          : ImageModelCharacterNumber(image: ''),
      name: json['name'] ?? '',
      origin: json['origin'] != null
          ? OriginModelCharacterNumber.fromJson(json['origin'])
          : OriginModelCharacterNumber(name: '', id: 0),
      publisher: json['publisher'] != null
          ? PublisherModelCharacterNumber.fromJson(json['publisher'])
          : PublisherModelCharacterNumber(name: '', id: 0),
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
class ImageModelCharacterNumber {
  final String image;

  ImageModelCharacterNumber({
    required this.image,
  });

  factory ImageModelCharacterNumber.fromJson(Map<String, dynamic> json) {
    return ImageModelCharacterNumber(
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
class OriginModelCharacterNumber {
  final String name;
  final int id;

  OriginModelCharacterNumber({
    required this.name,
    required this.id,
  });

  factory OriginModelCharacterNumber.fromJson(Map<String, dynamic> json) {
    return OriginModelCharacterNumber(
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
class PublisherModelCharacterNumber {
  final String name;
  final int id;

  PublisherModelCharacterNumber({
    required this.name,
    required this.id,
  });

  factory PublisherModelCharacterNumber.fromJson(Map<String, dynamic> json) {
    return PublisherModelCharacterNumber(
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
