// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelFormImage _$PixelFormImageFromJson(Map<String, dynamic> json) =>
    PixelFormImage(
      id: json['id'] as String,
      fileName: json['filename'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      urlFullSize: json['url_full_size'] as String,
      urlMediumSize: json['url_medium_size'] as String?,
      urlSmallSize: json['url_small-size'] as String?,
    );

Map<String, dynamic> _$PixelFormImageToJson(PixelFormImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.fileName,
      'title': instance.title,
      'description': instance.description,
      'url_full_size': instance.urlFullSize,
      'url_medium_size': instance.urlMediumSize,
      'url_small-size': instance.urlSmallSize,
    };
