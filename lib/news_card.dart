// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/skeleton.dart';

class NewsCard extends StatelessWidget {
  final String child;
  const NewsCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Hero(
                    tag: child,
                    child: Image.asset(
                      child,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Skeleton(
                      child: 'Technology',
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(height: 5),
                    const Skeleton(
                      child:
                          "Amazon's T-Rex Pro-Review: This fitness gear is on its own league",
                    ),
                    const SizedBox(height: 5),
                    const Skeleton(
                      child: '26 Nov, 2022',
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
