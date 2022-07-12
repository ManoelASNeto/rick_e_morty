import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_e_morty/core/navigations/routes.dart';
import 'package:rick_e_morty/presentation/bloc/characters_bloc.dart';

import '../../injection_container.dart';
import '../../presentation/pages/home_page.dart';

class AppRouter {
  final _charactersAll = sl<CharactersBloc>();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _charactersAll..add(AllCharacters()),
                  child: const HomePage(),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Erro'),
                  ),
                ));
    }
  }
}
