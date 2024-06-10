import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> imageSource() {
  return [
    'assets/images/image_item_1.png',
    'assets/images/image_item_2.png',
    'assets/images/image_item_3.png',
    'assets/images/image_item_4.png',
    'assets/images/image_item_5.png',
    'assets/images/image_item_6.png',
    'assets/images/image_item_7.png',
    'assets/images/image_item_8.png',
    'assets/images/image_item_1.png',
    'assets/images/image_item_2.png',
    'assets/images/image_item_3.png',
    'assets/images/image_item_4.png',
    'assets/images/image_item_5.png',
    'assets/images/image_item_6.png',
    'assets/images/image_item_7.png',
    'assets/images/image_item_8.png',
  ];
}

List createShuffledListFromImageSource2() {
  List shuffledImages = [];
  List sourceArray = imageSource();
  for (var element in sourceArray) {
    shuffledImages.add(element);
  }
  shuffledImages.shuffle();
  return shuffledImages;
}

List<bool> getInitialItemStateList2() {
  List<bool> initialItem = <bool>[];
  for (int i = 0; i < 36; i++) {
    initialItem.add(true);
  }
  return initialItem;
}

List<GlobalKey<FlipCardState>> createFlipCardStateKeysList2() {
  List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
  for (int i = 0; i < 36; i++) {
    cardStateKeys.add(GlobalKey<FlipCardState>());
  }
  return cardStateKeys;
}
