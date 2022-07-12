import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/characters_bloc.dart';
import '../bloc/characters_state.dart';
import '../widget/card_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.enjpg.com/img/2020/rick-and-morty-4k-3.jpg'),
                  fit: BoxFit.fitHeight,
                  opacity: 0.9,
                ),
              ),
              child: Stack(
                children: [
                  BlocBuilder<CharactersBloc, CharactersState>(
                      builder: (context, state) => _body(state, context)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          iconSize: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(CharactersState state, BuildContext context) {
    switch (state.status) {
      case CharactersStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case CharactersStatus.ready:
        return _ready(state, context);
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }

  Widget _ready(CharactersState state, BuildContext context) {
    return ListView.builder(
      itemCount: state.response?.results?.length,
      itemBuilder: (context, position) {
        var allChar = state.response?.results?[position];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardCustom(
              id: allChar?.id ?? 0,
              name: allChar?.name ?? "Não Encontrado",
              image: allChar?.image,
              status: allChar?.status,
              gender: allChar?.gender,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
          ],
        );
      },
    );
  }
}
