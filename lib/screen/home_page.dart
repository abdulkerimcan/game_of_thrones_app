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
  List<String> icons = ["all", "stark", "targaryen", "lannister", "baratheon"];
  Color _selectedColor = Colors.white;
  int _selectedIndex = 0;

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
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (index == 1) {
                            _charactersFuture = CharacterApi.getHouseStark();
                            _selectedColor = Colors.blue;
                          } else if (index == 2) {
                            _charactersFuture =
                                CharacterApi.getHouseTargaryen();
                            _selectedColor = Colors.red;

                          } else if (index == 3) {
                            _charactersFuture =
                                CharacterApi.getHouseLannister();
                            _selectedColor = Colors.amber;

                          } else if (index == 4) {
                            _charactersFuture =
                                CharacterApi.getHouseBaratheon();
                            _selectedColor = Colors.yellow;

                          } else {
                            _charactersFuture = CharacterApi.getCharacters();
                            _selectedColor = Colors.white;
                          }

                          _selectedIndex = index;

                        });
                      },
                      child: SizedBox(
                        width: 60.0,
                        height: 40.0,
                        child: Image.asset("assets/houses/${icons[index]}.png",color: _selectedIndex == index ? _selectedColor : Colors.grey,),
                      ),
                    ),
                  );
                },
              ),
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
