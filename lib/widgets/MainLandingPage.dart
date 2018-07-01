import 'package:flutter/material.dart';
import 'package:wta_flutter/widgets/workpartylist.dart';
import 'package:wta_flutter/model/WorkParty.dart';

class WTAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Washington Trails Association Work Party App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Work Parties'),
        ),
        body: Center(
          child: FutureBuilder<WorkParties>(
            future: WorkParties.fromServer(),
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