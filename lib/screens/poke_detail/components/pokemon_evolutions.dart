import 'package:flutter/material.dart';
import 'package:pokedex/helpers/customWidget.dart';



class PokemonEvolutions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(controller),
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 250,
                color: Color(0xffe3e3e3).withAlpha(100),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 100,
                  flexibleSpace: Container(
                    padding: EdgeInsets.symmetric(vertical:20),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                        fontSize: getFontSize(context, 25),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}