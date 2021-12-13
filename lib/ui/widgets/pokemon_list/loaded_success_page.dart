import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_list/bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/ui/widgets/components/pokemon_card.dart';

class PokemonListLoadedSuccessPage extends StatefulWidget {
  final List<Pokemon> pokemons;
  const PokemonListLoadedSuccessPage({Key? key, required this.pokemons})
      : super(key: key);

  @override
  _PokemonListLoadedSuccessPageState createState() =>
      _PokemonListLoadedSuccessPageState();
}

class _PokemonListLoadedSuccessPageState
    extends State<PokemonListLoadedSuccessPage> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PrimaryScrollController(
        controller: scrollController,
        child: CupertinoScrollbar(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: <Widget>[
              CupertinoSliverRefreshControl(onRefresh: () async {
                BlocProvider.of<PokemonListBloc>(context)
                    .add(const PokemonListReloadEvent());
              }),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    widget.pokemons.length,
                    (index) => GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 500.0,
                        child: PokemonCard(pokemon: widget.pokemons[index]),
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
