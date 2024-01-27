// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Website _$WebsiteFromJson(Map<String, dynamic> json) => Website(
      api: json['API'] as String,
      description: json['Description'] as String,
      auth: json['Auth'] as String,
      isHttps: json['HTTPS'] == 'true',
      cors: json['Cors'] as String,
      link: json['Link'] as String,
      category: json['Category'] as String,
    );

Map<String, dynamic> _$WebsiteToJson(Website instance) => <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.isHttps.toString(),
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
