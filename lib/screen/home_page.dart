import 'package:flutter/material.dart';
import 'package:game_of_thrones_app/core/widget/character_card.dart';
import 'package:game_of_thrones_app/model/character_model.dart';
import 'package:game_of_thrones_app/service/character_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CharacterModel>?> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _charactersFuture = CharacterApi.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Of Thrones"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildBanner(context),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        "assets/houses/stark.png",
                        color: Colors.white,
                      )),
                );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _charactersFuture,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var character = snapshot.data[index];
                      return CharacterCard(
                        family: character?.family,
                        fullName: character?.fullName,
                        title: character?.title,
                        imagePath: character?.imageUrl,
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Container _buildBanner(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height / 5,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            image: DecorationImage(
                image: AssetImage("assets/throne.jpg"), fit: BoxFit.cover),
          ),
        );
  }
}
