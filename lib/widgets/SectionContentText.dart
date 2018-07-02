import 'package:flutter/material.dart';

class SectionContentTextWidget extends StatelessWidget
{
  final String _text;

  SectionContentTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text(
        _text,
        style: Theme.of(context).textTheme.body1
      ),
      padding: new EdgeInsets.all(5.0),
    );
  }
}