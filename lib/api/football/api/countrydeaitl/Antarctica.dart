import 'package:flutter/material.dart';

class Antarctica extends StatefulWidget {
  final String flag;
  const Antarctica({super.key, required  this.flag});

  @override
  State<Antarctica> createState() => _AntarcticaState();
}

class _AntarcticaState extends State<Antarctica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false
        ,
        title: Center(child: Text('Antarctica')),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [     Image.network(
              filterQuality: FilterQuality.high,
           widget.flag,
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
              Text('Antarctica, the icy and remote continent at the bottom of the world, is unique in many ways — and one of them is its absence from the world of football. Unlike other continents bustling with national teams, stadiums, and passionate fans, Antarctica has no national football team. The harsh climate, extreme isolation, and lack of permanent population make it impossible to form organized sports teams or leagues. Yet, this blank spot on the football map adds to Antarctica’s mystique, reminding us of the boundless diversity of our planet and the unique challenges faced by the places farthest from human civilization. While other continents chase trophies and glory, Antarctica '
                  'remains a silent guardian of frozen landscapes, wildlife, and awe-inspiring natural beauty'),
            ],
          ),
        ),
      ),
    );
  }
}
