import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
   MapScreen({Key? key,required this.darkmode}) : super(key: key);
  final bool darkmode;
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
     Future<void> _onMapCreated(GoogleMapController controller) async {
    //final brightness = Theme.of(context).brightness;

    // Load and apply dark map style
    final darkMapStyle =
        await rootBundle.loadString('assets/dark_map_style.json');
    controller.setMapStyle(darkMapStyle);
  }
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: widget.darkmode? Colors.grey.shade900:Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black.withOpacity(0.8),
              child:Center(child: Icon(Icons.arrow_back,color:Colors.grey,size: 28,),)),
          ),
        ),),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: true,
            //  zoomControlsEnabled: false,
              //controller.setMapStyle();
        onMapCreated:       widget.darkmode ? _onMapCreated : null,
        // _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      bottomNavigationBar: Container(
        height: 200,
        color:widget.darkmode? Colors.grey.shade900.withOpacity(0.7):Colors.grey.shade100.withOpacity(0.7),
      ),
    );
  }
}