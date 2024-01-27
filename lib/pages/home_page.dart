import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/model.dart';
import '../pages/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Website>> getData() async {
    final response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    final body = json.decode(response.body)['entries'] as List<dynamic>;
    final formatedData =
        body.map((element) => Website.fromJson(element)).toList();
    return formatedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Websites',
        ),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!
                    .map((website) => Card(
                          color: Colors.green[400],
                          child: ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          DetailsPage(website: website))),
                              title: Text(
                                website.description,
                                style: const TextStyle(fontSize: 18),
                              )),
                        ))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return buildWaitingWidget();
            }
          }),
    );
  }

}
