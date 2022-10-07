import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:latlong2/latlong.dart';
import 'package:map_test2/make_marker.dart';
import 'firebase_options.dart';
import 'my_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';

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
  late MapController _mapController;
  List<Marker> marker_list = [];
  double zoom_level =18.4;
  final storeCollection = FirebaseFirestore.instance.collection('geo_test');
  // .withConverter<Store>(
  //   fromFirestore: (snapshot,_) => Store.fromJson(snapshot.data()!),
  //   toFirestore: (post,_) => post.toJson(),
  // );


  Future<void> getLocation() async {
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
    _mapController = MapController();
    print(latitude);
    print(longitude);

    storeCollection.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        marker_list.add(make_Marker(doc['loc'].latitude,doc['loc'].longitude, doc['name'],doc['category'], context));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.note_add),
            onPressed: () {
              setState(() {
                getLocation();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text('TESTTESTTESTTESTTESTTESTTESTTEST'),),
          if(latitude != null)
          Flexible(
              child: FlutterMap(
              mapController: _mapController,
            options: MapOptions(
              // center: LatLng(37.491, 127.03),
              center: LatLng(latitude!, longitude!),
              zoom: zoom_level,
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
              //   maxZoom:19.4,
              //   mini:true,
              //   padding: 10,
              //   alignment: Alignment.bottomRight
              // )
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                      onPressed: (){
                        _mapController.move(_mapController.center,_mapController.zoom +2);
                      },
                  child: Icon(Icons.zoom_in),),
                  FloatingActionButton(
                    onPressed: (){
                      _mapController.move(_mapController.center,_mapController.zoom -2);
                    },
                    child: Icon(Icons.zoom_out),),
                ],
              )
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: marker_list
                //[make_Marker(37.4911, 127.03035, '드림플러스', context)],
              )
            ],
          ))
        ],
      ),
    );
  }
}


//
// class Store{
//   Store({required this.name, required this.loc});
//   final String name;
//   final LatLng loc;
//
//   Store.fromJson(Map<String, Object?> json)
//       : this(
//     name: json['name']! as String,
//     loc: json['loc'] as LatLng ,
//   );
//
//   Map<String, Object?> toJson()=>{
//     'name' : name,
//     'loc' : loc,
//   };
// }



