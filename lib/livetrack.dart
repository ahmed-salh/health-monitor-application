import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'navigation_drawer.dart';
import 'package:firebase_database/firebase_database.dart';

class MyLocationPage extends StatefulWidget {
  // MyLocationPage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  MyLocationPageState createState() => MyLocationPageState();
}

class MyLocationPageState extends State<MyLocationPage> {
  late StreamSubscription _locationSubscription;
  // Location _locationTracker = Location();
  final database = FirebaseDatabase.instance.ref();
  late Marker marker;
  late var lat;
  late var lng;
  //Set<Marker> marker = {};
  late Circle circle;
  //Set<Circle> circle = {};
  late GoogleMapController _controller;

  @override
  void initState() {
    setState(() {
      marker = Marker(
        markerId: MarkerId("livetrack"),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
      );
      circle = Circle(
          circleId: CircleId("car"),
          zIndex: 1,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withAlpha(70));
    });
    super.initState();
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load("assets/location-pin-connectsafely-37.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(lat, lng, Uint8List imageData) {
    LatLng latlng = LatLng(lat!, lng!);
    /*  this.setState(() {
      marker = Marker{
        markerId: MarkerId("livetrack");
      position: latlng;
      rotation: newLocalData.heading!;
      zIndex: 2;
      flat: true;
      anchor: Offset(0.5, 0.5);
      icon:
      }
    });*/

    setState(() {
      marker = Marker(
        markerId: MarkerId("livetrack"),
        position: latlng,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
      );
      circle = Circle(
          circleId: CircleId("car"),
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      database.child('LATITUDE').onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        setState(() {
          lat = data;
        });
      });
      database.child('LONGITUDE').onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        setState(() {
          lng = data;
        });
      });

      _controller.animateCamera(CameraUpdate.newCameraPosition(
          new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(lat, lng),
              tilt: 0,
              zoom: 18.00)));
      updateMarkerAndCircle(lat, lng, imageData);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        //title: Text('${widget.title}'),
        title: Text('Live Tracker'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        //markers: Set<Marker>.from(marker),
        circles: Set.of((circle != null) ? [circle] : []),
        //circles: Set<Circle>.from(circle),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_maps/services/geolocator_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  late final Position initialPosition;
  Map(this.initialPosition);

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorService geoService = GeolocatorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialPosition.longitude,
                widget.initialPosition.latitude),
            zoom: 18.0),
        mapType: MapType.normal,
      )),
    );
  }
}


*/
