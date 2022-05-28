import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMaps extends StatefulWidget {
  @override
  State<YandexMaps> createState() => _YandexMapsState();
}

class _YandexMapsState extends State<YandexMaps> {
  Completer<YandexMapController> _completer = Completer();
  late final List<MapObject> mapObjects = [
    endPlacemark
  ];
  final MapObjectId placemarkId = MapObjectId('Petehof');
  final endPlacemark = Placemark(
      mapId: MapObjectId('end_placemark'),
      point: Point(latitude: 55.4424, longitude: 37.3636),
      icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage('assets/icons/place.png'),
          )
      )
  );

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(YandexMapController controller) {
      _completer.complete(controller);
      final placemark = Placemark(
          mapId: (placemarkId),
          point: Point(latitude: 59.84188, longitude: 30.251543),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              image:
              BitmapDescriptor.fromAssetImage('assets/icons/place.png')))
      );
      controller.moveCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: Point(latitude: 59.84188, longitude: 30.251543))));

      setState(() {
        mapObjects.add(placemark);
      });
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: YandexMap(
              onMapCreated: _onMapCreated,
              mapObjects: mapObjects,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: (){_requestRoutes();}, child: Text("BuildRoute"))
        ],
      ),
    );
  }
  Future<void> _requestRoutes() async {
    final placemark = Placemark(
        mapId: (placemarkId),
        point: Point(latitude: 59.84188, longitude: 30.251543),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image:
            BitmapDescriptor.fromAssetImage('assets/icons/place.png'))));
    print('Points: ${placemark.point},${endPlacemark.point}');
    var resultWithSession = YandexDriving.requestRoutes(
        points: [
          RequestPoint(point: placemark.point, requestPointType: RequestPointType.wayPoint),
          RequestPoint(point: endPlacemark.point, requestPointType: RequestPointType.wayPoint),
        ],
        drivingOptions: DrivingOptions(
            initialAzimuth: 0,
            routesCount: 5,
            avoidTolls: true
        )
    );

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => _SessionPage(
                placemark,
                endPlacemark,
                resultWithSession.session,
                resultWithSession.result
            )
        )
    );
  }
}

class _SessionPage extends StatefulWidget {
  final Future<DrivingSessionResult> result;
  final DrivingSession session;
  final Placemark startPlacemark;
  final Placemark endPlacemark;

  _SessionPage(this.startPlacemark, this.endPlacemark, this.session, this.result);

  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<_SessionPage> {
  late final List<MapObject> mapObjects = [
    widget.startPlacemark,
    widget.endPlacemark
  ];

  final List<DrivingSessionResult> results = [];
  bool _progress = true;

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    super.dispose();

    _close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Driving ${widget.session.id}')),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        YandexMap(
                            mapObjects: mapObjects
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                              children: <Widget>[
                                SizedBox(
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        !_progress ? Container() : TextButton.icon(
                                            icon: const CircularProgressIndicator(),
                                            label: const Text('Cancel'),
                                            onPressed: _cancel
                                        )
                                      ],
                                    )
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: _getList(),
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }
  List<Widget> _getList() {
    final list = <Widget>[];

    if (results.isEmpty) {
      list.add((Text('Nothing found')));
    }

    for (var r in results) {
      list.add(Container(height: 20));

      r.routes!.asMap().forEach((i, route) {
        list.add(Text('Route $i: ${route.metadata.weight.timeWithTraffic.text}'));
      });

      list.add(Container(height: 20));
    }

    return list;
  }

  Future<void> _cancel() async {
    await widget.session.cancel();

    setState(() { _progress = false; });
  }

  Future<void> _close() async {
    await widget.session.close();
  }

  Future<void> _init() async {
    await _handleResult(await widget.result);
  }

  Future<void> _handleResult(DrivingSessionResult result) async {
    setState(() { _progress = false; });

    if (result.error != null) {
      print('Error: ${result.error}');
      return;
    }

    setState(() { results.add(result); });
    setState(() {
      result.routes!.asMap().forEach((i, route) {
        mapObjects.add(Polyline(
          mapId: MapObjectId('route_${i}_polyline'),
          coordinates: route.geometry,
          strokeColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          strokeWidth: 3,
        ));
      });
    });
  }
}

