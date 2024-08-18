import 'package:comic_app/controller/exports/exports.dart';

/*
modelo para obtener los comics en el home, con un limite de 10
*/
class ComicsHomeModels {
  final int id;
  final VolumeModel name;
  final String issueNumber;
  final String coverDate;
  final String description;
  final String imageUrl;
  final List<PersonCredits> credits;
  final List<CharactersCredits> charactersCredits;
  final List<TeamCredits> teamCredits;
  final List<LocationsCredits> locationsCredits;
  final List<ConceptCredits> conceptCredits;

  ComicsHomeModels({
    required this.id,
    required this.name,
    required this.issueNumber,
    required this.coverDate,
    required this.description,
    required this.imageUrl,
    required this.credits,
    required this.charactersCredits,
    required this.teamCredits,
    required this.locationsCredits,
    required this.conceptCredits,
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
      credits: (json['person_credits'] as List<dynamic>?)
              ?.map((creditJson) => PersonCredits.fromJson(creditJson))
              .toList() ??
          [],
      charactersCredits: (json['character_credits'] as List<dynamic>?)
              ?.map(
                  (characterJson) => CharactersCredits.fromJson(characterJson))
              .toList() ??
          [],
      teamCredits: (json['team_credits'] as List<dynamic>?)
              ?.map((teamJson) => TeamCredits.fromJson(teamJson))
              .toList() ??
          [],
      locationsCredits: (json['location_credits'] as List<dynamic>?)
              ?.map((locationJson) => LocationsCredits.fromJson(locationJson))
              .toList() ??
          [],
      conceptCredits: (json['concept_credits'] as List<dynamic>?)
              ?.map((conceptJson) => ConceptCredits.fromJson(conceptJson))
              .toList() ??
          [],
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
      'person_credits': credits.map((credit) => credit.toJson()).toList(),
      'character_credits':
          charactersCredits.map((character) => character.toJson()).toList(),
      'team_credits': teamCredits.map((team) => team.toJson()).toList(),
      'location_credits':
          locationsCredits.map((location) => location.toJson()).toList(),
      'concept_credits':
          conceptCredits.map((concept) => concept.toJson()).toList(),
    };
  }
}

class VolumeModel {
  final int id;
  final String name;

  VolumeModel({
    required this.id,
    required this.name,
  });

  factory VolumeModel.fromJson(Map<String, dynamic> json) {
    return VolumeModel(
      id: json['id'] ?? 0,
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

class PersonCredits {
  final int id;
  final String name;
  final String role;

  PersonCredits({
    required this.id,
    required this.name,
    required this.role,
  });

  factory PersonCredits.fromJson(Map<String, dynamic> json) {
    return PersonCredits(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
    };
  }
}

class CharactersCredits {
  final int id;
  final String name;

  CharactersCredits({
    required this.id,
    required this.name,
  });

  factory CharactersCredits.fromJson(Map<String, dynamic> json) {
    return CharactersCredits(
      id: json['id'] ?? 0,
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

class TeamCredits {
  final int id;
  final String name;

  TeamCredits({
    required this.id,
    required this.name,
  });

  factory TeamCredits.fromJson(Map<String, dynamic> json) {
    return TeamCredits(
      id: json['id'] ?? 0,
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

class LocationsCredits {
  final int id;
  final String name;

  LocationsCredits({
    required this.id,
    required this.name,
  });

  factory LocationsCredits.fromJson(Map<String, dynamic> json) {
    return LocationsCredits(
      id: json['id'] ?? 0,
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

class ConceptCredits {
  final int id;
  final String name;

  ConceptCredits({
    required this.id,
    required this.name,
  });

  factory ConceptCredits.fromJson(Map<String, dynamic> json) {
    return ConceptCredits(
      id: json['id'] ?? 0,
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

// Utilidad para eliminar etiquetas HTML de las descripciones
 
