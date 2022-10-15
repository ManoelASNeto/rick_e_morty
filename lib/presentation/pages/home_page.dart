import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rick_e_morty/presentation/widget/glassmorphism.dart';

import '../bloc/characters_bloc.dart';
import '../bloc/characters_state.dart';

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
                'https://i.pinimg.com/originals/01/97/38/01973813faf7d7f4539e6296add2fd93.jpg'),
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
        return _loading();
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
              return GlassMorphism(
                id: allChar?.id ?? 0,
                name: allChar?.name ?? 'Sem Nome',
                image: allChar?.image,
                status: allChar?.status,
                gender: allChar?.gender,
                location: allChar?.location?.name,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: state.response?.infoEntity?.prev != null,
                child: IconButton(
                  iconSize: 60,
                  onPressed: () {
                    _charactersBloc.add(
                      NextPage(state.response!.infoEntity!.prev!),
                    );
                  },
                  icon: Icon(
                    MdiIcons.arrowLeftBoldOutline,
                    color: Colors.green[500],
                  ),
                ),
              ),
              Text(
                '${state.response?.infoEntity?.pages}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              IconButton(
                iconSize: 60,
                onPressed: () {
                  _charactersBloc.add(
                    NextPage(state.response!.infoEntity!.next!),
                  );
                },
                icon: Icon(
                  MdiIcons.arrowRightBoldOutline,
                  color: Colors.green[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/originals/01/97/38/01973813faf7d7f4539e6296add2fd93.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://www.pngplay.com/wp-content/uploads/14/Rick-And-Morty-Logo-Transparent-File.png'),
            const SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              color: Colors.green[700],
            ),
          ],
        ),
      ),
    );
  }
}
