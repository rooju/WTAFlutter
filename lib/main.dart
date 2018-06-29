import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<WorkParties> fetchPost() async {
  final response =
  await http.get('https://www.wta.org/volunteer/schedule/workparties.json');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return WorkParties.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class WorkParty {
  String name;
  String what_it_takes;
  String overview;
  double number_of_assistant_crew_leaders;
  String work_party_schedule;
  String project_description;
  double number_of_crew_leaders;
  DateTime start_date_time;
  double estimated_work_party_size;
  String leader;

  WorkParty();

  factory WorkParty.fromJson(Map<String, dynamic> json)
  {
    var wpItem = new WorkParty();

    wpItem.name = json['name'];
    wpItem.estimated_work_party_size = json['estimated_work_party_size'];
    wpItem.leader = json['leader']['name'];

    return wpItem;
  }

  @override
  String toString() {
    return '$name by $leader';
  }
}

class AllItems {
  List<WorkParty> all_items;

  AllItems();

  factory AllItems.fromJson(dynamic allItemsJson) {
    var wp = new AllItems();

    wp.all_items = new List<WorkParty>();
    for (var item in allItemsJson)
    {
      wp.all_items.add(WorkParty.fromJson(item));
    }

    return wp;
  }
}

class WorkParties {
  bool showRosterRequests;
  AllItems items;

  WorkParties();

  factory WorkParties.fromJson(Map<String, dynamic> json) {
    var wp = new WorkParties();

    wp.showRosterRequests = json['show_roster_requests'];
    wp.items = AllItems.fromJson(json['results']['all_items']);
    return wp;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<WorkParties>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.items.all_items[0].toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}