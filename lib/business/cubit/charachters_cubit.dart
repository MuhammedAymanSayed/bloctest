import 'package:bloc/bloc.dart';
import 'package:bloctest/data/models/characters.dart';
import 'package:bloctest/data/repostries/characters_repostry.dart';
import 'package:meta/meta.dart';

part 'charachters_state.dart';

class CharachtersCubit extends Cubit<CharachtersState> {
  final CharactersRepository charactersRepository;

  List<Character> characters = [];

  CharachtersCubit(this.charactersRepository) : super(CharachtersInitial());

   List<Character> getAllCharacters() {
    charactersRepository.getAllCharacter().then((characters) {
      emit(LoadedCharachters(characters));
      this.characters = characters;
    });

    return characters;
  }
}
