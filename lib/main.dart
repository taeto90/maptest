import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test2/make_marker.dart';
import 'firebase_options.dart';
import 'my_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  double? latitude;
  double? longitude;
  //List<Store> store_list = [];
  var stores = FirebaseFirestore.instance.collection('geo_test').get();


  void getLocation() async {
    print('-------------------------------getlocation');
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude=myLocation.latitude;
    longitude=myLocation.longitude;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('-------------------------------init');
    getLocation();
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text('TESTTESTTESTTESTTESTTESTTESTTEST'),),
          if(latitude != null)
          Flexible(
              child: FlutterMap(
            options: MapOptions(
              // center: LatLng(37.491, 127.03),
              center: LatLng(latitude!, longitude!),
              zoom: 18,
              maxZoom: 18.4,
              enableScrollWheel: true,
              enableMultiFingerGestureRace: false,
            ),

            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                  source: 'AAAAAAAAAAAAAAA',
              onSourceTapped: (){}),

              // FlutterMapZoomButtons(
              //   minZoom:4,
              //   maxZoom:19,
              //   mini:true,
              //   padding: 10,
              //   alignment: Alignment.bottomRight
              // )
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  make_Marker(37.4911, 127.03035, '드림플러스', context)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

// class Store{
//   Store({required this.name, required this.lat, required this.lng});
//   final String name;
//   final double lat;
//   final double lng;
//
//   Store.fromJson(Map<String, Object?> json)
//       : this(
//     name: json['name']! as String,
//     lat: json['loc'].latitude as GeoPoint ,
//     lon: json['loc'].longitude as GeoPoint ,
//   );
//
//   Map<String, Object?> toJson()=>{
//     'title' : title,
//     'likes' : likes,
//     'createAt' : createAt,
//     'imageUrl' : imageUrl,
//   };
// }
// void getData() {
//   databaseReference
//       .collection("stores")
//       .getDocuments()
//       .then((QuerySnapshot snapshot) {
//     snapshot.documents.forEach((f) {
//       print('${f.data}}');
//       GeoPoint pos = f.data['position'];
//       LatLng latLng = new LatLng(pos.latitude, pos.longitude);
//
//     });
//   });
// }