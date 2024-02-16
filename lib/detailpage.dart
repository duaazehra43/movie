import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.hero,
  });

  final Movies hero;

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double> _colorGradientValue;
  late Animation<double> _whiteGradientValue;

  late bool _changeToBlack;
  late bool _enableInfoItems;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorGradientValue = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
        parent: _controller!,
      ),
    );

    _whiteGradientValue = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0.1, 1, curve: Curves.fastOutSlowIn),
        parent: _controller!,
      ),
    );

    _changeToBlack = false;
    _enableInfoItems = false;

    Future.delayed(const Duration(milliseconds: 600), () {
      _controller!.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _changeToBlack = true;
        });
      });
    });

    _controller!.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!
      ..removeStatusListener(_statusListener)
      ..dispose();
    super.dispose();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _enableInfoItems = true;
      });
    }
  }

  //-----------------------
  Future<void> _backButtonTap() async {
    setState(() {
      _enableInfoItems = false;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _changeToBlack = false;
      });
    });
    _controller!.reverse().then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: '${widget.hero.heroName}background',
              child: AnimatedBuilder(
                animation: _controller!,
                builder: (_, __) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(widget.hero.rawColor!), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          _colorGradientValue.value,
                          _whiteGradientValue.value
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Hero(
                    tag: widget.hero.pathImage!,
                    child: Image.asset(
                      widget.hero.pathImage!,
                      height: size.height * .55,
                      width: size.width,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        heightFactor: .7,
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          child: Hero(
                            tag: widget.hero.heroName!,
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              style: textTheme.headline2!.copyWith(
                                color: _changeToBlack
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              child: Text(
                                widget.hero.heroName!
                                    .replaceAll(' ', '\n')
                                    .toLowerCase(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Hero(
                                tag: widget.hero.name!,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: AnimatedDefaultTextStyle(
                                    duration: kThemeAnimationDuration,
                                    style: textTheme.headline5!.copyWith(
                                      color: _changeToBlack
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    child: Text(
                                      widget.hero.name!.toLowerCase(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            tween: Tween(
                              begin: 0,
                              end: _enableInfoItems ? 1.0 : 0.0,
                            ),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/movies.png',
                              height: 35,
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 30),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            widget.hero.description!,
                            style: GoogleFonts.leagueSpartan(
                              color: Colors.grey[500],
                              height: 1.5,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Divider(height: 30),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            'movies',
                            style: textTheme.headline5!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    itemCount: widget.hero.movies!.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final movie = widget.hero.movies![index];
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 1000 + (300 * index)),
                        curve: Curves.elasticOut,
                        tween: Tween(
                          begin: 0,
                          end: _enableInfoItems ? 0.0 : 1.0,
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 50 * value),
                            child: Opacity(
                              opacity: 1 - value.clamp(0.0, 1.0),
                              child: child,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(imageUrl: movie.urlImage),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 0,
            child: SafeArea(
              child: Hero(
                tag: 'back.button.tag',
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: _backButtonTap,
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
