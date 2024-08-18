/*
modelo para obtener el personaje en el banner del home
*/
class BannerCharacterHomeModels {
  final int id;
  final ImageModel image;
  final String name;
  final String realName;
  final OriginModel origin;
  final PublisherModel publisher;

  BannerCharacterHomeModels({
    required this.id,
    required this.image,
    required this.name,
    required this.origin,
    required this.publisher,
    required this.realName,
  });

  // Método para convertir JSON a un objeto de BannerCharacterHomeModels
  factory BannerCharacterHomeModels.fromJson(Map<String, dynamic> json) {
    return BannerCharacterHomeModels(
      id: json['id'] ?? '',
      image: ImageModel.fromJson(json['image']),
      name: json['name'] ?? '',
      origin: OriginModel.fromJson(json['origin']),
      publisher: PublisherModel.fromJson(json['publisher']),
      realName: json['real_name'] ?? '',
    );
  }

  // Método para convertir un objeto de BannerCharacterHomeModels a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image.toJson(),
      'name': name,
      'origin': origin.toJson(),
      'publisher': publisher.toJson(),
      'real_name': realName,
    };
  }
}

// Modelo para la imagen del personaje
class ImageModel {
  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;

  ImageModel({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      iconUrl: json['icon_url'] ?? '',
      mediumUrl: json['medium_url'] ?? '',
      screenUrl: json['screen_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon_url': iconUrl,
      'medium_url': mediumUrl,
      'screen_url': screenUrl,
    };
  }
}

// Modelo para el origen del personaje
class OriginModel {
  final String name;

  OriginModel({required this.name});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

// Modelo para el publisher del personaje
class PublisherModel {
  final String name;

  PublisherModel({required this.name});

  factory PublisherModel.fromJson(Map<String, dynamic> json) {
    return PublisherModel(
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
