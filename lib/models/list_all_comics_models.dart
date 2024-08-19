/*
modelo para obtener la lista de todos los comics
*/
import 'package:comic_app/controller/exports/exports.dart';

class ListAllComicsModels {
  final int id;
  final VolumeModelAll name;
  final String issueNumber;
  final String coverDate;
  final String description;
  final String imageUrl;
  final List<PersonCreditsAll> credits;
  final List<CharactersCreditsAll> charactersCredits;
  final List<TeamCreditsAll> teamCredits;
  final List<LocationsCreditsAll> locationsCredits;
  final List<ConceptCreditsAll> conceptCredits;

  ListAllComicsModels({
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
  factory ListAllComicsModels.fromJson(Map<String, dynamic> json) {
    return ListAllComicsModels(
      id: json['id'] ?? 0,
      name: VolumeModelAll.fromJson(json['volume']),
      issueNumber: json['issue_number'] ?? 'N/A',
      coverDate: json['cover_date'] ?? 'Desconocido',
      description: DeleteHttmlTags.removeHtmlTags(json['description'] ?? ''),
      imageUrl: json['image']?['medium_url'] ?? '',
      credits: (json['person_credits'] as List<dynamic>?)
              ?.map((creditJson) => PersonCreditsAll.fromJson(creditJson))
              .toList() ??
          [],
      charactersCredits: (json['character_credits'] as List<dynamic>?)
              ?.map((characterJson) =>
                  CharactersCreditsAll.fromJson(characterJson))
              .toList() ??
          [],
      teamCredits: (json['team_credits'] as List<dynamic>?)
              ?.map((teamJson) => TeamCreditsAll.fromJson(teamJson))
              .toList() ??
          [],
      locationsCredits: (json['location_credits'] as List<dynamic>?)
              ?.map(
                  (locationJson) => LocationsCreditsAll.fromJson(locationJson))
              .toList() ??
          [],
      conceptCredits: (json['concept_credits'] as List<dynamic>?)
              ?.map((conceptJson) => ConceptCreditsAll.fromJson(conceptJson))
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

class VolumeModelAll {
  final int id;
  final String name;

  VolumeModelAll({
    required this.id,
    required this.name,
  });

  factory VolumeModelAll.fromJson(Map<String, dynamic> json) {
    return VolumeModelAll(
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

class PersonCreditsAll {
  final int id;
  final String name;
  final String role;

  PersonCreditsAll({
    required this.id,
    required this.name,
    required this.role,
  });

  factory PersonCreditsAll.fromJson(Map<String, dynamic> json) {
    return PersonCreditsAll(
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

class CharactersCreditsAll {
  final int id;
  final String name;

  CharactersCreditsAll({
    required this.id,
    required this.name,
  });

  factory CharactersCreditsAll.fromJson(Map<String, dynamic> json) {
    return CharactersCreditsAll(
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

class TeamCreditsAll {
  final int id;
  final String name;

  TeamCreditsAll({
    required this.id,
    required this.name,
  });

  factory TeamCreditsAll.fromJson(Map<String, dynamic> json) {
    return TeamCreditsAll(
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

class LocationsCreditsAll {
  final int id;
  final String name;

  LocationsCreditsAll({
    required this.id,
    required this.name,
  });

  factory LocationsCreditsAll.fromJson(Map<String, dynamic> json) {
    return LocationsCreditsAll(
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

class ConceptCreditsAll {
  final int id;
  final String name;

  ConceptCreditsAll({
    required this.id,
    required this.name,
  });

  factory ConceptCreditsAll.fromJson(Map<String, dynamic> json) {
    return ConceptCreditsAll(
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
