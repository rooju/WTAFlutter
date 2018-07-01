import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';

class WorkPartyDetailWidget extends StatelessWidget {
  WorkParty _item;

  WorkPartyDetailWidget(this._item);

  Widget _builder(BuildContext context, int index)
  {
    switch(index)
    {
      case 0:
        // First element is the image.
        return new Image.network(_item.image_url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 1,
      itemBuilder: _builder
    );
  }
}