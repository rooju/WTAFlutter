import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';

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