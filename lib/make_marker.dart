import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker make_Marker(double lat, double long, String name, int type,BuildContext context){
  var classify = {1:'image1.png',2:'Beer.png',3:'Cake.png',4:'Coffee.png'};
  return Marker(
      width: 50,
      height: 50,
      point: LatLng(lat, long),
      builder: (ctx)=> InkWell(
          child: Image.asset('assets/${classify[type]}'),
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
