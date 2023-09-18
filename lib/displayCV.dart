import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import 'cv_provider.dart';
import 'editCV.dart';

class DisplayCV extends StatelessWidget {
  const DisplayCV({super.key, required this.cvProvider});

  final CVProvider cvProvider;

  @override
  Widget build(BuildContext context) {
    final fullName = cvProvider.fullName.isNotEmpty
        ? cvProvider.fullName
        : 'Ramish Benoit Lottin Budzi';
    final bio = cvProvider.bio.isNotEmpty
        ? cvProvider.bio
        : 'Hardworking and passionate job seeker with strong organizational skills always eager to learn and contribute';
    final slack = cvProvider.slack.isNotEmpty
        ? cvProvider.slack
        : 'Ramish Benoit';
    final github =
    cvProvider.github.isNotEmpty ? cvProvider.github : '@lottin';

    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditCV(cvProvider: cvProvider),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          ListTile(
            title: Text(
              fullName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              bio,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          ListTile(
            leading: const Iconify(Mdi.slack),
            title: Align(
              alignment: const Alignment(-1.1, 0),
              child: Text(slack),
            ),
          ),
          ListTile(
            leading: const Iconify(IconParkOutline.github),
            title: Align(
              alignment: const Alignment(-1.1, 0),
              child: Text(github),
            ),
          ),
        ],
      ),
    );
  }
}