// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

//I used json_serializable to convert API response to model automatically
@JsonSerializable()
class Website {
  @JsonKey(name:'API')
  final String api;
  @JsonKey(name:'Description')
  final String description;
  @JsonKey(name:'Auth')
  final String auth;
  @JsonKey(name: 'HTTPS')
  final bool isHttps;
  @JsonKey(name: 'Cors')
  final String cors;
  @JsonKey(name: 'Link')
  final String link;
  @JsonKey(name: 'Category')
  final String category;

  Website({
    required this.api,
    required this.description,
    required this.auth,
    required this.isHttps,
    required this.cors,
    required this.link,
    required this.category,
  });

  factory Website.fromJson(Map<String,dynamic> json)=>  _$WebsiteFromJson(json);
}
