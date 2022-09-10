import 'dart:async';
import 'dart:convert';

import 'package:game_of_thrones_app/model/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future<List<CharacterModel>?> getCharacters() async {
//       const unirest = require("unirest");

//     const req = unirest("GET", "https://game-of-thrones1.p.rapidapi.com/Characters/5");

//       req.headers({
    //"X-RapidAPI-Key": "7977dbabdfmsh13abf55305f2b15p1702dejsn5ed1e3d2e9b5",
    //"X-RapidAPI-Host": "game-of-thrones1.p.rapidapi.com",
    //"useQueryString": true
// });

    try {
      var uri = Uri.parse("https://game-of-thrones1.p.rapidapi.com/Characters");

      var response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "7977dbabdfmsh13abf55305f2b15p1702dejsn5ed1e3d2e9b5",
        "X-RapidAPI-Host": "game-of-thrones1.p.rapidapi.com",
        "useQueryString": "true"
      });

      var data = jsonDecode(response.body);
      List<CharacterModel> characters = [];

      for (var element in data) {
        CharacterModel characterModel = CharacterModel(
            fullName: element["fullName"],
            family: element["family"],
            title: element["title"],
            imageUrl: element["imageUrl"],
            id: element["id"]);
        characters.add(characterModel);
      }

      print(characters.length);

      return characters;
    } catch (e) {
      print(e);
    }
  }

  static Future<List<CharacterModel>?> getHouseStark() async {
    try {
      var uri = Uri.parse("https://game-of-thrones1.p.rapidapi.com/Characters");

      var response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "Your Api Key Here",
        "X-RapidAPI-Host": "game-of-thrones1.p.rapidapi.com",
        "useQueryString": "true"
      });

      var data = jsonDecode(response.body);
      List<CharacterModel> houseStark = [];

      for (var element in data) {
        CharacterModel characterModel = CharacterModel(
            fullName: element["fullName"],
            family: element["family"],
            title: element["title"],
            imageUrl: element["imageUrl"],
            id: element["id"]);
        if (element["lastName"] == "Stark" || element["lastName"] == "Snow") {
          houseStark.add(characterModel);
        }
      }

      return houseStark;
    } catch (e) {
      print(e);
    }
  }

  static Future<List<CharacterModel>?> getHouseTargaryen() async {
    try {
      var uri = Uri.parse("https://game-of-thrones1.p.rapidapi.com/Characters");

      var response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "7977dbabdfmsh13abf55305f2b15p1702dejsn5ed1e3d2e9b5",
        "X-RapidAPI-Host": "game-of-thrones1.p.rapidapi.com",
        "useQueryString": "true"
      });

      var data = jsonDecode(response.body);
      List<CharacterModel> houseTargaryen = [];

      for (var element in data) {
        CharacterModel characterModel = CharacterModel(
            fullName: element["fullName"],
            family: element["family"],
            title: element["title"],
            imageUrl: element["imageUrl"],
            id: element["id"]);
        if (element["lastName"] == "Targaryen" ||
            element["lastName"] == "Targaryan") {
          houseTargaryen.add(characterModel);
        }
      }

      return houseTargaryen;
    } catch (e) {
      print(e);
    }
  }

  static Future<List<CharacterModel>?> getHouseBaratheon() async {
    try {
      var uri = Uri.parse("https://game-of-thrones1.p.rapidapi.com/Characters");

      var response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "7977dbabdfmsh13abf55305f2b15p1702dejsn5ed1e3d2e9b5",
        "X-RapidAPI-Host": "game-of-thrones1.p.rapidapi.com",
        "useQueryString": "true"
      });

      var data = jsonDecode(response.body);
      List<CharacterModel> houseBaratheon = [];

      for (var element in data) {
        CharacterModel characterModel = CharacterModel(
            fullName: element["fullName"],
            family: element["family"],
            title: element["title"],
            imageUrl: element["imageUrl"],
            id: element["id"]);
        if (element["lastName"] == "Baratheon") {
          houseBaratheon.add(characterModel);
        }
      }

      return houseBaratheon;
    } catch (e) {
      print(e);
    }
  }

  static Future<List<CharacterModel>?> getHouseLannister() async {
    try {
      var uri = Uri.parse("https://game-of-thrones1.p.rapidapi.com/Characters");

      var response = await http.get(uri, headers: {
        "X-RapidAPI-Key": "7977dbabdfmsh13abf55305f2b15p1702dejsn5ed1e3d2e9b5",
        "X-RapidAPI-Host": "game-of-thrones1.p.rapidapi.com",
        "useQueryString": "true"
      });

      var data = jsonDecode(response.body);
      List<CharacterModel> houseLannister = [];

      for (var element in data) {
        CharacterModel characterModel = CharacterModel(
            fullName: element["fullName"],
            family: element["family"],
            title: element["title"],
            imageUrl: element["imageUrl"],
            id: element["id"]);
        if (element["lastName"] == "Lannister") {
          houseLannister.add(characterModel);
        }
      }

      return houseLannister;
    } catch (e) {
      print(e);
    }
  }
}
