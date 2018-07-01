import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';

class WorkPartyDetailWidget extends StatelessWidget {
  WorkParty _item;

  WorkPartyDetailWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Divider(color: Colors.lightBlue),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Image.network(_item.image_url),
            ),
            new Expanded(
              child: new Text(_item.name, textAlign: TextAlign.center),
            ),
            new Expanded(
              child: new Text(_item.leader, textAlign: TextAlign.center),
            )
          ],
        )
      ],
    );
  }
}