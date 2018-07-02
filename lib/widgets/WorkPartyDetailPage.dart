import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';
import 'package:wta_flutter/widgets/WorkPartyDetail.dart';

class WorkPartyDetailPage extends StatelessWidget {
  final WorkParty _item;

  WorkPartyDetailPage(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
            title: Text(_item.name, style: Theme.of(context).accentTextTheme.body2),
            subtitle: Text(_item.type.name, style: Theme.of(context).accentTextTheme.caption),
        ),
      ),
      body: WorkPartyDetailWidget(context, _item)
    );
  }
}