import 'package:bloctest/business/cubit/charachters_cubit.dart';
import 'package:bloctest/constants/strings.dart';
import 'package:bloctest/data/repostries/characters_repostry.dart';
import 'package:bloctest/data/web_server/characters-web_servers.dart';
import 'package:bloctest/presentation/screens/charachter_details_screen.dart';
import 'package:bloctest/presentation/screens/charachter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharachtersCubit charachtersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charachtersCubit = CharachtersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charachtersCubit,
            child: CharachterScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(),
        );
    }
  }
}
