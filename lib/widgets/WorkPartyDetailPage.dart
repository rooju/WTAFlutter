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
        title: Text(_item.name),
      ),
      body: WorkPartyDetailWidget(_item),
    );
  }
}