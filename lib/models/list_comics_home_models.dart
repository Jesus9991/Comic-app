/*
modelo para obtener los comics en el home, con un limite de 10
*/
import 'package:comic_app/controller/exports/exports.dart';

class ComicsHomeModels {
  final int id;
  final VolumeModel name;
  final String issueNumber;
  final String coverDate;
  final String description;
  final String imageUrl;

  ComicsHomeModels({
    required this.id,
    required this.name,
    required this.issueNumber,
    required this.coverDate,
    required this.description,
    required this.imageUrl,
  });

  // Método para convertir JSON a un objeto de ComicsHomeModels
  factory ComicsHomeModels.fromJson(Map<String, dynamic> json) {
    return ComicsHomeModels(
      id: json['id'] ?? 0,
      name: VolumeModel.fromJson(json['volume']),
      issueNumber: json['issue_number'] ?? 'N/A',
      coverDate: json['cover_date'] ?? 'Desconocido',
      description: DeleteHttmlTags.removeHtmlTags(json['description'] ?? ''),
      imageUrl: json['image']?['medium_url'] ?? '',
    );
  }

  // Método para convertir un objeto de ComicsHomeModels a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.toJson(),
      'issue_number': issueNumber,
      'cover_date': coverDate,
      'description': description,
      'image_url': imageUrl,
    };
  }
}

//volumen para obtener el nombre del comic

class VolumeModel {
  final int id;
  final String name;

  VolumeModel({
    required this.id,
    required this.name,
  });

  factory VolumeModel.fromJson(Map<String, dynamic> json) {
    return VolumeModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
