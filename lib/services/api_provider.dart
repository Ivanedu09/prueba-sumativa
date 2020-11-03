import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_about_detail_model.dart';
import 'package:pokedex/models/pokemon_about_location_model.dart';
import 'package:pokedex/models/pokemon_about_model.dart';
import 'package:pokedex/models/pokemon_about_species_model.dart';
import 'package:pokedex/models/pokemon_evolucion_chain.dart';
import 'package:pokedex/models/pokemon_evolucion_detail.dart';
import 'package:pokedex/models/pokemon_evolucion_model.dart';
import 'package:pokedex/models/pokemon_list_model.dart';
import 'package:pokedex/models/pokemon_movimientos.dart';
import 'package:pokedex/models/pokemon_stats_detail_model.dart';
import 'package:pokedex/models/pokemon_stats_model.dart';
import 'package:pokedex/models/pokemon_stats_species_model.dart';


class ApiProvider{
  Dio dio = Dio();

  Future<List<PokemonListModel>> obtenerListaPokemon() async{
    List<PokemonListModel> lista = [];
    try {
      Response resp = await dio.get('https://pokedexvuejs.herokuapp.com/pokedexdb');
      final pokemones = PokemonListResponse.fromJsonList(resp.data);
      lista = pokemones.items;
    } catch (e) {

    }
    return lista;
  }

  Future<PokemonAboutModel> obtenerInfoAboutPokemon(String nombrePokemon) async{
    var pokeAbout = PokemonAboutModel();
    try {
      Response respA = await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeDetail = PokeAboutDetail.fromJson(respA.data);
      Response respB = await dio.get('https://pokeapi.co/api/v2/pokemon/${pokeDetail.id}/encounters');
      final pokeListLocation = PokemonAboutLocationListModel.fromJsonList(respB.data);
      Response respC = await dio.get('https://pokeapi.co/api/v2/pokemon-species/${pokeDetail.id}');
      final pokeSpecies = PokeAboutSpecies.fromJson(respC.data);

      pokeAbout = PokemonAboutModel(
        pokeDetail: pokeDetail,
        pokeLocations: pokeListLocation.items,
        pokeSpecies: pokeSpecies
      );

    } catch (e) {

    }

    return pokeAbout;
  }

   Future<AboutMmoves> obtenerInfomovespokemon(String nombrePokemon) async{
    var pokemoves = AboutMmoves();
    try {
      Response respA = await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeforms = AboutMmoves.fromJson(respA.data);
      pokemoves= pokeforms;

    } catch (e) {

    }

    return pokemoves;
  }

  Future<PokemonStatsModel> obtenerInfoStatsPokemon(String nombrePokemon) async{
    var pokeStats = PokemonStatsModel();
    try {
      Response respA = await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeStatDetail = PokeStatsDetail.fromJson(respA.data);
      Response respB = await dio.get('https://pokeapi.co/api/v2/pokemon-species/${pokeStatDetail.id}');
      final pokeStatSpecies = PokeStatsSpecies.fromJson(respB.data);

      pokeStats = PokemonStatsModel(
        pokeStatDetail: pokeStatDetail,
        pokeStatSpecies: pokeStatSpecies
      );
    } 
    catch (e) {
    }

    return pokeStats;
  }

  Future<PokemonEvolucionModel> obtenerInfoEvoPokemon(String nombrePokemon) async{
    var pokeEvolucion = PokemonEvolucionModel();
    try {
      Response respA = await dio.get('https://pokeapi.co/api/v2/pokemon-species/${pokeStatDetail.id}');
      final especiesEvo= EspeciesEvo.fromJson(respA.data);
      Response respB = await dio.get();
      final evolucionChain = EvolucionChain.fromJson(respB.data);

      pokeEvolucion= PokemonEvolucionModel(
        especiesEvo: especiesEvo,
        evolucionChain: evolucionChain
      );
    }
    catch (e){
    }

    return pokeEvolucion;
  }
    
}

