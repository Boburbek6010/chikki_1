// To parse this JSON data, do
//final yandexRoutesModel = yandexRoutesModelFromJson(jsonString);

import 'dart:convert';

YandexRoutesModel yandexRoutesModelFromJson(String str) => YandexRoutesModel.fromJson(json.decode(str));

String yandexRoutesModelToJson(YandexRoutesModel data) => json.encode(data.toJson());

class YandexRoutesModel {
  YandexRoutesModel({
    required this.type,
    required this.properties,
    required this.features,
  });

  String type;
  YandexRoutesModelProperties properties;
  List<Feature> features;

  factory YandexRoutesModel.fromJson(Map<String, dynamic> json) => YandexRoutesModel(
    type: json["type"],
    properties: YandexRoutesModelProperties.fromJson(json["properties"]),
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "properties": properties.toJson(),
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
  };
}

Feature featureModelFromJson(String str) => Feature.fromJson(json.decode(str));

class Feature {
  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  String type;
  Geometry geometry;
  FeatureProperties properties;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: FeatureProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "geometry": geometry.toJson(),
    "properties": properties.toJson(),
  };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class FeatureProperties {
  FeatureProperties({
    required this.name,
    required this.description,
    required this.boundedBy,
    required this.geocoderMetaData,
  });

  String name;
  String description;
  List<List<double>> boundedBy;
  GeocoderMetaData geocoderMetaData;

  factory FeatureProperties.fromJson(Map<String, dynamic> json) => FeatureProperties(
    name: json["name"],
    description: json["description"],
    boundedBy: List<List<double>>.from(json["boundedBy"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
    geocoderMetaData: GeocoderMetaData.fromJson(json["GeocoderMetaData"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "boundedBy": List<dynamic>.from(boundedBy.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "geocoderMetaData": geocoderMetaData.toJson(),
  };
}


class GeocoderMetaData {
  GeocoderMetaData({
    required this.precision,
    required this.text,
    required this.kind,
  });

  String precision;
  String text;
  String kind;

  factory GeocoderMetaData.fromJson(Map<String, dynamic> json) => GeocoderMetaData(
    precision: json["precision"],
    text: json["text"],
    kind: json["kind"],
  );

  Map<String, dynamic> toJson() => {
    "precision": precision,
    "text": text,
    "kind": kind,
  };
}



class Category {
  Category({
    required this.categoryClass,
    required this.name,
  });

  String categoryClass;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryClass: json["class"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "class": categoryClass,
    "name": name,
  };
}

class Phone {
  Phone({
    required this.type,
    required this.formatted,
  });

  String type;
  String formatted;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    type: json["type"],
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "formatted": formatted,
  };
}

class YandexRoutesModelProperties {
  YandexRoutesModelProperties({
    required this.responseMetaData,
  });

  ResponseMetaData responseMetaData;

  factory YandexRoutesModelProperties.fromJson(Map<String, dynamic> json) => YandexRoutesModelProperties(
    responseMetaData: ResponseMetaData.fromJson(json["ResponseMetaData"]),
  );

  Map<String, dynamic> toJson() => {
    "ResponseMetaData": responseMetaData.toJson(),
  };
}

class ResponseMetaData {
  ResponseMetaData({
    required this.searchResponse,
    required this.searchRequest,
  });

  SearchResponse searchResponse;
  SearchRequest searchRequest;

  factory ResponseMetaData.fromJson(Map<String, dynamic> json) => ResponseMetaData(
    searchResponse: SearchResponse.fromJson(json["SearchResponse"]),
    searchRequest: SearchRequest.fromJson(json["SearchRequest"]),
  );

  Map<String, dynamic> toJson() => {
    "SearchResponse": searchResponse.toJson(),
    "SearchRequest": searchRequest.toJson(),
  };
}

class SearchRequest {
  SearchRequest({
    required this.request,
    required this.skip,
    required this.results,
    required this.boundedBy,
  });

  String request;
  int skip;
  int results;
  List<List<double>> boundedBy;

  factory SearchRequest.fromJson(Map<String, dynamic> json) => SearchRequest(
    request: json["request"],
    skip: json["skip"],
    results: json["results"],
    boundedBy: List<List<double>>.from(json["boundedBy"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
  );

  Map<String, dynamic> toJson() => {
    "request": request,
    "skip": skip,
    "results": results,
    "boundedBy": List<dynamic>.from(boundedBy.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class SearchResponse {
  SearchResponse({
    required this.found,
    required this.display,
    required this.boundedBy,
  });

  int found;
  String display;
  List<List<double>> boundedBy;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    found: json["found"],
    display: json["display"],
    boundedBy: List<List<double>>.from(json["boundedBy"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
  );

  Map<String, dynamic> toJson() => {
    "found": found,
    "display": display,
    "boundedBy": List<dynamic>.from(boundedBy.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
