import 'package:flutter/material.dart';
import 'package:wta_flutter/model/WorkParty.dart';
import 'package:wta_flutter/widgets/PageSection.dart';
import 'package:wta_flutter/widgets/SectionContentText.dart';
import 'package:wta_flutter/model/Utils.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class WorkPartyDetailWidget extends StatelessWidget {
  WorkParty _item;
  BuildContext _context;
  List<Widget> _widgetList;

  WorkPartyDetailWidget(this._context, this._item)
  {
    _widgetList = new List<Widget>();

    _widgetList.add(new Image.network(_item.image_url));
    _widgetList.add(
      new PageSectionWidget(
        'When',
        new ListTile(
          leading: Icon(Icons.calendar_today),
          title:
            new Text(
              '${DateTimeUtils.ToDisplayString(_item.startDateTime)} - ${DateTimeUtils.ToDisplayString(_item.endDateTime)}',
              style: Theme.of(_context).textTheme.body1)
        )
      )
    );
    _widgetList.add(new PageSectionWidget('Overview', new SectionContentTextWidget(_item.overview)));
    _widgetList.add(new PageSectionWidget('About the area', new SectionContentTextWidget(_item.aboutArea)));
    var mapWidget = FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 5.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate:
            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(markers: [
          new Marker(
            width: 80.0,
            height: 80.0,
            point: new LatLng(51.5, -0.09),
            builder: (ctx) =>
            new Container(
              child: new FlutterLogo(),
            ),
          ),
        ])
      ],
    );

    _widgetList.add(new PageSectionWidget('Where', new Flexible(child: mapWidget)));
  }

  Widget _builder(BuildContext context, int index)
  {
    return _widgetList[index];
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new ListView.builder(
      itemCount: _widgetList.length,
      itemBuilder: _builder
    );
  }
}