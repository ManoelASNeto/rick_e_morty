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
  late CharactersBloc _charactersBloc;
  @override
  void initState() {
    _charactersBloc = BlocProvider.of<CharactersBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.enjpg.com/img/2020/rick-and-morty-4k-3.jpg'),
            fit: BoxFit.fitHeight,
            opacity: 0.9,
          ),
        ),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) => _body(state, context),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.response?.results?.length,
            itemBuilder: (context, position) {
              var allChar = state.response?.results?[position];
              return CardCustom(
                id: allChar?.id ?? 0,
                name: allChar?.name ?? 'Sem Nome',
                image: allChar?.image,
                status: allChar?.status,
                gender: allChar?.gender,
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  _charactersBloc.add(
                    NextPage(state.response!.infoEntity!.prev!),
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.green[500],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                  iconSize: 60,
                  onPressed: () {
                    _charactersBloc.add(
                      NextPage(state.response!.infoEntity!.next!),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.green[500],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
