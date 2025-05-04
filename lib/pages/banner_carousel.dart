import 'dart:async';

import 'package:flutter/material.dart';

import '../data/vos/banner_model.dart';
import '../resources/dimensions.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerModel>? banner;

  const BannerCarousel({super.key, this.banner});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  double position = 0.0;
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _autoPlay();
  }

  void _autoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (widget.banner == null || widget.banner!.isEmpty) return;
      _currentPage = (_currentPage + 1) % widget.banner!.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.banner?.length ?? 0,
      onPageChanged: (int page) {
        setState(() {
          position = page.toDouble();
          _currentPage = page;
        });
      },
      itemBuilder: (context, index) {
        final item = widget.banner![index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius:
            const BorderRadius.all(Radius.circular(BORDER_RADIUS_5)),
            child: Stack(
              children: <Widget>[
                Image.network(item.url ?? "", fit: BoxFit.fill),
                Positioned(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 0, 1, 1.0),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: MARGIN_SMALL_16, left: MARGIN_SMALL_20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "10%",
                              style: TextStyle(
                                fontSize: HOME_PAGE_BANNER_DISCOUNT_PERCENT,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: MARGIN_SMALL_1X),
                              ),
                            ),
                            TextSpan(
                              text: "off",
                              style: TextStyle(
                                fontSize: TITLE_TEXT_FONT_SIZE,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ]),
                        ),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "with",
                              style: TextStyle(
                                fontSize: FONT_SIZE_14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: MARGIN_SMALL_1X),
                              ),
                            ),
                            TextSpan(
                              text: "KBZ",
                              style: TextStyle(
                                fontSize: TITLE_TEXT_FONT_SIZE,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: MARGIN_SMALL_1X),
                              ),
                            ),
                            TextSpan(
                              text: "debit card",
                              style: TextStyle(
                                fontSize: FONT_SIZE_14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: MARGIN_SMALL_20, bottom: MARGIN_SMALL_16),
                    child: SizedBox(
                      width: 93,
                      height: 62,
                      child: Image.asset(
                        "images/Credit_Card.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
