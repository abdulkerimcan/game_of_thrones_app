import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    this.fullName,
    this.imagePath,
    this.title,
    this.family
  }) : super(key: key);

  final String? imagePath;
  // final String? petType;

  final String? fullName;
  final String? title;

  final String? family;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 250,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            width: size.width * 0.48,
            child: Container(
              height: size.height / 5,
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomRight: 
                  Radius.circular(20), topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Center(child: Text("$title",style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),)),
                     Text("$fullName",style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),),
                     Text("$family",style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),),
                    
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: SizedBox(
              width: size.width * 0.48,
              height: size.height * 0.24,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      image:  DecorationImage(image: NetworkImage("$imagePath"),fit: BoxFit.cover)
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
