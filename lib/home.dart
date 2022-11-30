// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:news_app/news_card.dart';
import 'package:news_app/read_page.dart';
import 'package:news_app/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  final List _post = [
    "assets/charlesdeluvio-FdDkfYFHqe4-unsplash.jpg",
    "assets/le-buzz-studio-tVnm9I9jb8I-unsplash.jpg",
    "assets/mika-baumeister-5pltkatOWk4-unsplash.jpg",
    "assets/szabo-viktor-UfseYCHvIH0-unsplash.jpg",
    "assets/timothy-hales-bennett-OwvRB-M3GwE-unsplash.jpg",
  ];

  final List stories = [
    "Story 1",
    "Story 2",
    "Story 3",
    "Story 4",
    "Story 5",
    "Story 6",
    "Story 7",
    "Story 8",
    "Story 9",
    "Story 10",
    "Story 11",
  ];

  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      controller.addListener(() {
        double value = controller.offset / 350;

        setState(() {
          topContainer = 0;
          closeTopContainer = controller.offset > 50;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 24,
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: IconButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'News App',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            //stories

            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : 100,
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      return Stories(child: stories[index]);
                    },
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: Center(
                child: ListView.builder(
                  controller: controller,
                  itemCount: _post.length,
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    if (topContainer > 0.5) {
                      scale = index + 0.5 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale, scale),
                        alignment: Alignment.bottomCenter,
                        child: Align(
                          heightFactor: 1.0,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () => Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return ReadPage(
                                  imagePath: _post[index],
                                );
                              },
                            )),
                            child: NewsCard(
                              child: _post[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
