// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_memory_game/views/easy.dart';

List<String> createShuffledListFromImageSource() {
  // List of image paths
  List<String> imagePaths = [
    "assets/images/image_item_1.png",
    "assets/images/image_item_2.png",
    "assets/images/image_item_3.png",
    "assets/images/image_item_4.png",
    "assets/images/image_item_5.png",
    "assets/images/image_item_6.png",
    "assets/images/image_item_7.png",
    "assets/images/image_item_8.png",

    // Add more image paths if needed
  ];

  // Select two unique images
  List<String> selectedImages = imagePaths.take(2).toList();

  // DuplicRate the selected images to create a list of four images
  List<String> duplicatedImages = [...selectedImages, ...selectedImages];

  // Shuffle the list to mix the cards
  duplicatedImages.shuffle();

  return duplicatedImages;
}
