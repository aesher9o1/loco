import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'side_drawer.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer(),
        body: Stack(
          children: <Widget>[
            Maps(),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: FlatButton(
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Text("Fancy Icon Here"),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class Maps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapsState();
  }
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  var currentLocation = <String, double>{};
  var location = new Location();
  

  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 11.0,
  );


  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: _kInitialPosition, onMapCreated: _onMapCreated);
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
