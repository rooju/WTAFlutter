import 'package:flutter/material.dart';
import 'package:wta_flutter/widgets/SectionHeading.dart';
import 'package:wta_flutter/widgets/SectionContentText.dart';

class PageSectionWidget extends StatelessWidget
{
  final String _headingText;
  final Widget _contentWidget;

  PageSectionWidget(this._headingText, this._contentWidget);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Theme.of(context).dividerColor,
      child: new Column(
        children: <Widget>[
          new SectionHeadingTextWidget(_headingText),
          _contentWidget
        ]
      )
    );
  }


}