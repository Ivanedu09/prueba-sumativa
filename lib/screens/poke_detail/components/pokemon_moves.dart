import 'package:flutter/material.dart';
import 'package:pokedex/helpers/customWidget.dart';
import 'package:pokedex/services/api_provider.dart';


class PokemonMoves extends StatelessWidget {
   final String nombrePokemon;
  PokemonMoves({
    this.nombrePokemon
  });
  final ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: fullWidth(context),
      child: FutureBuilder<PokemonMovesModel>(
              future: apiProvider.obtenerInfomovespokemon(nombrePokemon),
              builder: (BuildContext context, AsyncSnapshot<PokemonMovesModel> snapshot){
                if(snapshot.hasData){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  );
                }
                else{
                  return Column(
                    children: [
                      CircularProgressIndicator()
                    ],
                  );
                }
              },
            ),
          );
        }
      }
      
      class PokemonMovesModel {
}