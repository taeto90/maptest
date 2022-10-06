import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text('TESTTESTTESTTESTTESTTESTTESTTEST'),),
          Flexible(
              child: FlutterMap(
            options: MapOptions(
              center: LatLng(37.491, 127.03),
              zoom: 18
            ),
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(source: 'AAAAAAAAAAAAAAA',
              onSourceTapped: (){}),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      width: 50,
                  height: 50,
                  point: LatLng(37.4911, 127.03035),
                    builder: (ctx)=> InkWell(
                        child: Image.asset('assets/image1.png'),
                    onTap:(){
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)
                              )
                          ),
                          builder: (_)=>Center(
                            child: ElevatedButton(
                              child: Text('드림플러스', style: TextStyle(fontSize: 25),),
                              onPressed: (){Navigator.pop(context);},
                            ),
                          ));
                    })
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

