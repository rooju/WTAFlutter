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
  String image_url;

  WorkParty();

  factory WorkParty.fromJson(Map<String, dynamic> json)
  {
    var wpItem = new WorkParty();

    wpItem.name = json['name'];
    wpItem.estimated_work_party_size = json['estimated_work_party_size'];
    wpItem.leader = json['leader']['name'];
    wpItem.image_url = json['image_url']?.toString();

    if (wpItem.image_url == null || wpItem.image_url.isEmpty)
    {
        wpItem.image_url = 'https://www.wta.org/++theme++plonetheme.wta/images/wta-logo.png';
    }

    if (wpItem.image_url.startsWith('//www.wta.org'))
    {
        wpItem.image_url = 'https:' + wpItem.image_url;
    }

    return wpItem;
  }

  @override
  String toString() {
    return '$name by $leader';
  }
}

class WorkParties {
  List<WorkParty> items;

  WorkParties();

  factory WorkParties.fromJson(Map<String, dynamic> json) {
    var wp = new WorkParties();

    wp.items = new List<WorkParty>();
    for (var item in json['results']['all_items'])
    {
      wp.items.add(WorkParty.fromJson(item));
    }
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
                return new WorkPartyListWidget(items: snapshot.data.items);
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

class WorkPartyListWidget extends StatelessWidget {
  final List<WorkParty> items;

  WorkPartyListWidget({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return new WorkPartyItemWidget(items[index]);
      },
    );
  }
}

class WorkPartyItemWidget extends StatelessWidget {
  final WorkParty item;

  WorkPartyItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Divider(color: Colors.lightBlue),
        new Row(
          children: <Widget>[
            new Expanded(
            child: new Image.network(item.image_url),
            ),
            new Expanded(
            child: new Text(item.name, textAlign: TextAlign.center),
            ),
            new Expanded(
            child: new Text(item.leader, textAlign: TextAlign.center),
            )
          ],
        )
      ],
    );
  }
}