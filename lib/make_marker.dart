import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker make_Marker(double lat, double long, String name, BuildContext context){
  return Marker(
      width: 50,
      height: 50,
      point: LatLng(lat, long),
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
                    child: Text(name, style: TextStyle(fontSize: 25),),
                    onPressed: (){Navigator.pop(context);},
                  ),
                ));
          })
  );
}
