import 'package:flutter/material.dart';
import 'package:pokedex/helpers/colorTheme.dart';
import 'package:pokedex/helpers/customWidget.dart';
import 'package:pokedex/models/pokemon_movimientos.dart';
import 'package:pokedex/services/api_provider.dart';


class PokemonMoves extends StatelessWidget {
  final String nombrePokemon;
  final String tipo;
  PokemonMoves({this.nombrePokemon, this.tipo});
  ApiProvider apiProvider = ApiProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<AboutMmoves>(
        future: apiProvider.obtenerInfomovespokemon(nombrePokemon),
        builder:
            (BuildContext context, AsyncSnapshot<AboutMmoves> snapshot) {
          if (snapshot.hasData) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: fullWidth(context),
                child: Wrap(
                    children: snapshot.data.moves
                        .map((move) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical:5),
                              height:getDimention(context,40),
                              margin: EdgeInsets.symmetric(
                                horizontal:8,vertical:6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: setSecondaryColor(tipo),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(color:Colors.grey)
                                  ]
                                ),
                                child: Text(
                              move.move.name,
                              style: TextStyle(
                                fontSize: getFontSize(context, 20),
                                color: Colors.white10),
                            )))
                        .toList()));
          } else {
            return Column(
              children: [CircularProgressIndicator()],
            );
          }
        },
      ),
    );
  }
}
