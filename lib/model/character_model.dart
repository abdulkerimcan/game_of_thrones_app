// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

class CharacterModel {
    CharacterModel({
        this.id,
        this.fullName,
        this.lastName,
        this.title,
        this.family,
        this.imageUrl,
    });

    int? id;
    String? fullName;
    String? lastName;
    String? title;
    String? family;
    String? imageUrl;

    factory CharacterModel.fromRawJson(String str) => CharacterModel.fromJson(json.decode(str));
    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"] == null ? null : json["id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        title: json["title"] == null ? null : json["title"],
        family: json["family"] == null ? null : json["family"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    );
}
