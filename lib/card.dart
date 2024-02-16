import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/model.dart';

class CardPage extends StatelessWidget {
  const CardPage({
    super.key,
    required this.movies,
    required this.factorChange,
  });

  final Movies movies;
  final double? factorChange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final separation = size.height * .24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            top: separation,
            child: Hero(
              tag: '${movies.heroName}background',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(movies.rawColor!),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: separation * factorChange!,
            bottom: size.height * .35,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Transform.scale(
                scale: lerpDouble(1, .4, factorChange!),
                child: Hero(
                  tag: movies.pathImage!,
                  child: Image.asset(movies.pathImage!),
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 100,
            top: size.height * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Hero(
                    tag: movies.heroName!,
                    child: Text(
                      movies.heroName!.replaceAll(' ', '\n').toLowerCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                Hero(
                  tag: movies.name!,
                  child: Text(
                    movies.name!.toLowerCase(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const SizedBox(height: 25),
                Text.rich(
                  const TextSpan(
                    text: 'learn more',
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  ),
                  style: GoogleFonts.leagueSpartan(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
