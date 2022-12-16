// ignore_for_file: prefer_typing_uninitialized_variables, unused_field

import 'package:flutter/material.dart';
import 'package:news_app/home.dart';

class ReadPage extends StatelessWidget {
  final List _feedImage = [
    "assets/charlesdeluvio-FdDkfYFHqe4-unsplash.jpg",
    "assets/le-buzz-studio-tVnm9I9jb8I-unsplash.jpg",
    "assets/mika-baumeister-5pltkatOWk4-unsplash.jpg",
    "assets/szabo-viktor-UfseYCHvIH0-unsplash.jpg",
    "assets/timothy-hales-bennett-OwvRB-M3GwE-unsplash.jpg",
  ];

  ReadPage({super.key, required this.imagePath});
  final String imagePath;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
          ),
        ),
      ),
      body: ImageFeed(imagePath: imagePath),
    );
  }
}

class ImageFeed extends StatelessWidget {
  const ImageFeed({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image
        Expanded(
          child: Hero(
            tag: imagePath,
            child: Container(
              width: 500,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        // Feed Data
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Technology',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Amazon's T-Rex Pro-Review: This fitness gear is on its own league,Amazon's T-Rex Pro-Review: This fitness gear is on its own league,Amazon's T-Rex Pro-Review: This fitness gear is on its own league,Amazon's T-Rex Pro-Review: This fitness gear is on its own league",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '26 Nov, 2022',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        //
      ],
    );
  }
}
