import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';
import 'package:wta_flutter/widgets/workpartyitem.dart';

class WorkPartyListWidget extends StatelessWidget {
  final List<WorkParty> items;

  WorkPartyListWidget({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return new WorkPartyItemWidget(context, items[index]);
      },
    );
  }
}