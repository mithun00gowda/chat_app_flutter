import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelFormImage {
  String id;
  @JsonKey(name: 'filename')
  String fileName;
  String? title;
  String? description;
  @JsonKey(name: 'url_full_size')
  String urlFullSize;
  @JsonKey(name: 'url_medium_size')
  String? urlMediumSize;
  @JsonKey(name: 'url_small-size')
  String? urlSmallSize;

  PixelFormImage({
    required this.id,
    required this.fileName,
    this.title,
    this.description,
    required this.urlFullSize,
    this.urlMediumSize,
    this.urlSmallSize,
  });

  factory PixelFormImage.fromJson(Map<String, dynamic> json) =>
      _$PixelFormImageFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixelFormImageToJson(this);
}
