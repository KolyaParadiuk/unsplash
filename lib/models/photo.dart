library photo;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'photo.g.dart';

abstract class Urls implements Built<Urls, UrlsBuilder> {
  // fields go here

  String get raw;
  String get full;
  String get regular;
  String get small;
  String get thumb;

  Urls._();

  factory Urls([updates(UrlsBuilder b)]) = _$Urls;

  static Serializer<Urls> get serializer => _$urlsSerializer;
}

abstract class Photo implements Built<Photo, PhotoBuilder> {
  // fields go here
  String get id;
  Urls get urls;
  Photo._();

  factory Photo([updates(PhotoBuilder b)]) = _$Photo;

  static Serializer<Photo> get serializer => _$photoSerializer;
}
