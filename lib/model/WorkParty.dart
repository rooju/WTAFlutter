import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


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

  static Future<WorkParties> fromServer() async {
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
}