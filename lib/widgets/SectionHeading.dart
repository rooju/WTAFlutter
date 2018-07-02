import 'package:flutter/material.dart';

class SectionHeadingTextWidget extends StatelessWidget
{
  final String _text;

  SectionHeadingTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text(
        _text,
        style: Theme.of(context).textTheme.title
      ),
      padding: new EdgeInsets.all(5.0),
    );
  }
}