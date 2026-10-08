import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MaterialApp(home: SceneryGacha()));

class SceneryGacha extends StatefulWidget {
  const SceneryGacha({super.key});

  @override
  State<SceneryGacha> createState() => _SceneryGachaState();
}

class _SceneryGachaState extends State<SceneryGacha> {
  int n = 0, e = 0;
  bool loading = false;

  final emojis = ['🏔️', '🌊', '🌅', '🌌'];

  final images = [
    'https://haru49.github.io/scenery-images/arezoo-gholami-X71xg1n6Z1I-unsplash.jpg',
    'https://haru49.github.io/scenery-images/nazarizal-mohammad-KcYVMFAYDck-unsplash.jpg',
    'https://haru49.github.io/scenery-images/stephanie-klepacki-3hCaEmDO-i8-unsplash.jpg',
    'https://haru49.github.io/scenery-images/vishnu-prasad-4dP_EYKf2DA-unsplash.jpg',
  ];

  Future<void> gacha() async {
    setState(() => loading = true);

    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => e = (e + 1) % emojis.length);
    }

    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('🌍 絶景ガチャ'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: loading
                    ? Center(
                        child: Text(
                          emojis[e],
                          style: const TextStyle(fontSize: 100),
                        ),
                      )
                    : Image.network(
                        images[n],
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: loading ? null : gacha,
                child: const Text('絶景ガチャを回す！'),
              ),
            ],
          ),
        ),
      );
}