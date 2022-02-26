part of 'charachters_cubit.dart';

@immutable
abstract class CharachtersState {}

class CharachtersInitial extends CharachtersState {}

class LoadedCharachters extends CharachtersState {
  final List<Character> characters;

  LoadedCharachters(this.characters);
}
