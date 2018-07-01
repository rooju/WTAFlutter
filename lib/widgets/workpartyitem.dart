import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';
import 'package:wta_flutter/widgets/WorkPartyDetailPage.dart';

class WorkPartyItemWidget extends StatelessWidget {
  final WorkParty _item;
  BuildContext _context;

  WorkPartyItemWidget(this._item);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new InkWell(
      child: new Column(
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
      ),
      onTap: _GotoDetailPage,
    );
  }

  void _GotoDetailPage() {
    Navigator.of(_context).push(
      new MaterialPageRoute(builder: (context) => WorkPartyDetailPage(_item))
    );
  }
}