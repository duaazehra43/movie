import 'dart:math';
import 'package:flutter/material.dart';
import 'package:moviesapp/card.dart';
import 'package:moviesapp/detailpage.dart';
import 'package:moviesapp/model.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({
    super.key,
  });

  @override
  SliderPageState createState() => SliderPageState();
}

class SliderPageState extends State<SliderPage> {
  PageController? _pageController;
  late int _index;
  late int _auxIndex;
  double? _percent;
  double? _auxPercent;
  late bool _isScrolling;

  @override
  void initState() {
    _pageController = PageController();
    _index = 0;
    _auxIndex = _index + 1;
    _percent = 0.0;
    _auxPercent = 1.0 - _percent!;
    _isScrolling = false;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  void _pageListener() {
    _index = _pageController!.page!.floor();
    _auxIndex = _index + 1;
    _percent = (_pageController!.page! - _index).abs();
    _auxPercent = 1.0 - _percent!;

    _isScrolling = _pageController!.page! % 1.0 != 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const heroes = Movies.Moviess;
    const angleRotate = -pi * .5;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: kThemeAnimationDuration,
            top: 0,
            bottom: 0,
            right: _isScrolling ? 10 : 0,
            left: _isScrolling ? 10 : 0,
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, 50 * _auxPercent!),
                  child: CardPage(
                    movies: heroes[_auxIndex.clamp(0, heroes.length - 1)],
                    factorChange: _auxPercent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(-800 * _percent!, 100 * _percent!),
                  child: Transform.rotate(
                    angle: angleRotate * _percent!,
                    child: CardPage(
                      movies: heroes[_index],
                      factorChange: _percent,
                    ),
                  ),
                )
              ],
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => _openDetail(context, heroes[index]),
                child: const SizedBox(),
              );
            },
          )
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, Movies hero) {
    Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: DetailPage(
              hero: hero,
            ),
          );
        },
      ),
    );
  }
}
