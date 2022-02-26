import 'package:bloctest/data/models/characters.dart';
import 'package:bloctest/data/web_server/characters-web_servers.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;

  CharactersRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacter() async {
    final characters = await characterWebServices.getAllCharecter();
    return characters.map((e) => Character.fromJson(e)).toList();
  }
}
