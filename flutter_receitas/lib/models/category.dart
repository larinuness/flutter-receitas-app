import 'package:flutter/material.dart';

class Category {
  //id está como String mas poderia ser int tbm
  final String id;
  final String title;
  final Color color;

  Category({
    required this.id,
    required this.title,
    required this.color,
  });
}
