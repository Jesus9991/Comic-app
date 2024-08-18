import 'package:comic_app/controller/exports/exports.dart';
import 'package:equatable/equatable.dart';

abstract class BannerHomeCharacterState extends Equatable {
  @override
  List<Object> get props => [];
}

class BannerHomeCharacterInitial extends BannerHomeCharacterState {}

class BannerHomeCharacterLoading extends BannerHomeCharacterState {}

class BannerHomeCharacterLoaded extends BannerHomeCharacterState {
  final BannerCharacterHomeModels character;

  BannerHomeCharacterLoaded(this.character);

  @override
  List<Object> get props => [character];
}

class BannerHomeCharacterError extends BannerHomeCharacterState {
  final String message;

  BannerHomeCharacterError(this.message);

  @override
  List<Object> get props => [message];
}
