import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';

class IntroScreenViewmodel {
  List<PageViewModel>? pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(child: Image.asset(AppAssets.comingSoonGif, height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    ),
    PageViewModel(
      title: "Title of second page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(child: Image.asset(AppAssets.comingSoonGif, height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    ),
    PageViewModel(
        title: "Title of third page",
        body:
            "Here you can write the description of the page, to explain something...",
        image:
            Center(child: Image.asset(AppAssets.comingSoonGif, height: 175.0)),
        decoration: const PageDecoration(
            pageColor: Colors.white, titleTextStyle: TextStyle()))
  ];
}
