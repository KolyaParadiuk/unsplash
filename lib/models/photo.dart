library photo;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  // fields go here
  String get id;
  Photo._();

  factory Photo([updates(PhotoBuilder b)]) = _$Photo;

  static Serializer<Photo> get serializer => _$photoSerializer;
}
