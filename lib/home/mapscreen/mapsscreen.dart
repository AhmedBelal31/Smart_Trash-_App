// import 'dart:async';
// import 'dart:collection';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:smart_trash/home/mapscreen/repo/map_repo.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../network/remote/location helper.dart';
// import '../../style/color.dart';
// import 'distance and time.dart';
// import 'mapscubit/mapscubit.dart';
// import 'mapscubit/mapsstates.dart';
// import 'mapswidget.dart';
// import 'models/Place_suggestion.dart';
// import 'models/place.dart';
// import 'models/place_directions.dart';
// import 'models/places_webservices.dart';
//
// class mapsscreen extends StatefulWidget {
//   // const mapsscreen({Key? key}) : super(key: key);
//   @override
//   State<mapsscreen> createState() => _mapsscreenState();
// }
//
// class _mapsscreenState extends State<mapsscreen> {
//   @override
//   initState() {
//     super.initState();
//     getMyCurrentLocation();
//     getCustomMarker();
//
//   }
//
//   Completer<GoogleMapController> _controller = Completer();
//   FloatingSearchBarController controller = FloatingSearchBarController();
//   static Position? position;
//
//   Future<void> getMyCurrentLocation() async {
//     position = await LocationHelper.getCurrentLocation();
//
//     position = await Geolocator.getLastKnownPosition().whenComplete(() {
//       setState(() {});
//     });
//   }
//
//   static final CameraPosition _CameraPosition = CameraPosition(
//       target: LatLng(position!.latitude, position!.longitude),
//       bearing: 0.0,
//       tilt: 0.0,
//       zoom: 14.0);
//
//   //initial Camera Position
//   static const CameraPosition _initialCameraPosition = CameraPosition(
//     // target: LatLng(30.6323253177233, 31.080840789341373),
//     target: LatLng(30.57584187910638, 31.00852943270204),
//     bearing: 0.0,
//     tilt: 0.0,
//     zoom: 16.0,
//   );
//
//
//   // Set <Marker> wastyMarker = {} ;
//   var wastyMarker = HashSet<Marker>();
//   late BitmapDescriptor  customMarker ;
//   getCustomMarker() async{
//     customMarker = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty,
//         "assets/images/logo1.png" ,
//
//     );
//   }
//   var wastybin1 = 100 ;
//   var wastybin2 = 75 ;
//   var wastybin3 = 50 ;
//   var wastybin4 = 0 ;
//
//  List <Polyline> wastePolyline = [];
//  List <Polyline> wastePolyline2 = [];
//   createPolyline ()
//   {
//     wastePolyline.add(
//         Polyline(
//           polylineId:PolylineId('1') ,
//           color: Colors.black ,
//           width: 3,
//           points: [
//             LatLng(position!.latitude, position!.longitude),
//             LatLng(30.57584187910638, 31.00852943270204)],
//
//             patterns: [PatternItem.dash(20) , PatternItem.gap(10)] ,
//
//
//         )
//     );
//
//
//   }
//
//   createPolyline2 ()
//   {
//
//     wastePolyline.add(
//         Polyline(
//             polylineId:PolylineId('2') ,
//             color: Colors.black ,
//             width: 3,
//             points: [
//               LatLng(position!.latitude, position!.longitude),
//               LatLng(30.57748108747756, 31.013985531957832),
//             ],
//
//             patterns: [PatternItem.dash(20) , PatternItem.gap(10)]
//
//         )
//     );
//
//
//   }
//
//   createPolyline3 ()
//   {
//
//     wastePolyline.add(
//         Polyline(
//             polylineId:PolylineId('2') ,
//             color: Colors.black ,
//             width: 3,
//             points: [
//               LatLng(position!.latitude, position!.longitude),
//               LatLng(30.57317088334517, 31.00561590882143),
//             ],
//
//             patterns: [PatternItem.dash(20) , PatternItem.gap(10)]
//
//         )
//     );
//
//
//   }
//
//   createPolyline4 ()
//   {
//
//     wastePolyline.add(
//         Polyline(
//             polylineId:PolylineId('2') ,
//             color: Colors.black ,
//             width: 3,
//             points: [
//               LatLng(position!.latitude, position!.longitude),
//               LatLng(30.552191995974688, 31.008542079719163),
//             ],
//
//             patterns: [PatternItem.dash(20) , PatternItem.gap(10)]
//
//         )
//     );
//
//
//   }
//
//   bool isMark = true ;
//
//
//   Widget buildMap() {
//     return GoogleMap(
//       // initialCameraPosition: _CameraPosition ,
//       initialCameraPosition: _initialCameraPosition,
//       mapType: MapType.normal,
//       myLocationEnabled: true,
//       markers: wastyMarker,
//       // markers: markers,
//       zoomControlsEnabled: false,
//       myLocationButtonEnabled: false,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//         setState(() {
//           wastyMarker.add(
//             Marker(
//               markerId: MarkerId('1'),
//               position: LatLng(30.57584187910638, 31.00852943270204),
//               infoWindow: InfoWindow(
//                   title: 'Wasty ', snippet: "wasty bin is ${wastybin1} % full."),
//               onTap: (){
//                 //Get Data From Api
//                 setState(() {
//                   if(isMark == true)
//                     {
//                       createPolyline();
//                       isMark = !isMark ;
//
//                     }
//                 });
//
//
//               },
//               icon:customMarker
//             ),
//           );
//           wastyMarker.add(
//             Marker(
//               markerId: MarkerId('2'),
//               position: LatLng(30.57748108747756, 31.013985531957832),
//                 infoWindow: InfoWindow(
//                     title: 'Wasty ', snippet: "wasty bin is ${wastybin2} % full."),
//                 onTap: (){
//                   //Get Data From Api
//                   setState(() {
//                     if(isMark = true)
//                     {
//                       createPolyline2();
//                       isMark = !isMark ;
//                     }
//                   });
//
//                 },
//                 icon:customMarker
//
//             ),
//           );
//           wastyMarker.add(
//             Marker(
//               markerId: MarkerId('3'),
//               position: LatLng(30.57317088334517, 31.00561590882143),
//                 infoWindow: InfoWindow(
//                     title: 'Wasty ', snippet: "wasty bin is ${wastybin3} %  % full."),
//                 onTap: (){
//                   setState(() {
//                     if(isMark == true)
//                     {
//                       createPolyline3();
//                       isMark = !isMark ;
//                     }
//                   });
//                   //Get Data From Api
//                 },
//                 icon:customMarker
//             ),
//           );
//           wastyMarker.add(
//             Marker(
//               markerId: MarkerId('4'),
//               position: LatLng(30.552191995974688, 31.008542079719163),
//                 infoWindow: InfoWindow(
//                     title: 'Wasty ', snippet: "wasty bin is ${wastybin4}% full."),
//                 onTap: (){
//                   //Get Data From Api
//                   setState(() {
//                     if(isMark == true)
//                     {
//                       createPolyline4();
//                       isMark = !isMark ;
//                     }
//                   });
//                 },
//                 icon:customMarker
//
//             ),
//           );
//         });
//       },
//      polylines: placeDirections != null
//           ? {
//               Polyline(
//                 polylineId: const PolylineId('my_polyline'),
//                 color: Colors.black,
//                 width: 4,
//                 points: polylinePoints,
//               ),
//             }
//           : {},
//
//       // polylines:  wastePolyline2.toSet()    ,
//     );
//   }
//
//   Future<void> _goTomyCurrentLocation() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_CameraPosition));
//   }
//
//
//   List<PlaceSuggestion> places = [];
//
//   // these variables for getPlaceLocation
//
//   Set<Marker> markers = Set();
//   late PlaceSuggestion placeSuggestion;
//   late Place selectedPlace;
//   late Marker searchedPlaceMarker;
//   late Marker currentLocationMarker;
//   late CameraPosition goToSearchedForPlace;
//
//   // these variables for getDirections
//   PlaceDirections? placeDirections;
//   var progressIndicator = false;
//   late List<LatLng> polylinePoints;
//   var isSearchedPlaceMarkerClicked = false;
//   var isTimeAndDistanceVisible = false;
//   late String time;
//   late String distance;
//
//   void buildCameraNewPosition() {
//     goToSearchedForPlace = CameraPosition(
//       bearing: 0.0,
//       tilt: 0.0,
//       target: LatLng(
//         selectedPlace.result.geometry.location.lat,
//         selectedPlace.result.geometry.location.lng,
//       ),
//       zoom: 15,
//     );
//   }
//
//   void getSelectedPlaceLocation(context) {
//     final sessionToken = Uuid().v4();
//     BlocProvider.of<MapsCubit>(context)
//         .emitPlaceLocation(placeSuggestion.placeId, sessionToken);
//   }
//
//   Widget buildPlacesList() {
//     return ListView.builder(
//         itemBuilder: (ctx, index) {
//           return InkWell(
//             onTap: () async {
//               placeSuggestion = places[index];
//               controller.close();
//               getSelectedPlaceLocation(ctx);
//               polylinePoints.clear();
//               removeAllMarkersAndUpdateUI();
//             },
//             child: PlaceItem(
//               suggestion: places[index],
//             ),
//           );
//         },
//         itemCount: places.length,
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics());
//   }
//
//   void removeAllMarkersAndUpdateUI() {
//     setState(() {
//       markers.clear();
//     });
//   }
//
//   Widget buildSuggestionsBloc() {
//     return BlocBuilder<MapsCubit, MapsState>(
//       builder: (context, state) {
//         if (state is PlacesLoaded) {
//           places = (state).places;
//           if (places.length != 0) {
//             return buildPlacesList();
//           } else {
//             return Container();
//           }
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
//
//   Widget buildSelectedPlaceLocationBloc() {
//     return BlocListener<MapsCubit, MapsState>(
//       listener: (context, state) {
//         if (state is PlaceLocationLoaded) {
//           selectedPlace = (state).place;
//
//           goToMySearchedForLocation();
//           getDirections(context);
//         }
//       },
//       child: Container(),
//     );
//   }
//
//   void getDirections(context) {
//     BlocProvider.of<MapsCubit>(context).emitPlaceDirections(
//       LatLng(position!.latitude, position!.longitude),
//       LatLng(selectedPlace.result.geometry.location.lat,
//           selectedPlace.result.geometry.location.lng),
//     );
//   }
//
//   Future<void> goToMySearchedForLocation() async {
//     buildCameraNewPosition();
//     final GoogleMapController controller2 = await _controller.future;
//     controller2
//         .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));
//     buildSearchedPlaceMarker();
//   }
//
//   void buildSearchedPlaceMarker() {
//     searchedPlaceMarker = Marker(
//       position: goToSearchedForPlace.target,
//       markerId: MarkerId('1'),
//       onTap: () {
//         // buildCurrentLocationMarker();
//         // show time and distance
//         setState(() {
//           isSearchedPlaceMarkerClicked = true;
//           isTimeAndDistanceVisible = true;
//         });
//       },
//       infoWindow: InfoWindow(title: "${placeSuggestion.description}"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     );
//
//     addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
//   }
//
//   void buildCurrentLocationMarker() {
//     currentLocationMarker = Marker(
//       position: LatLng(position!.latitude, position!.longitude),
//       markerId: MarkerId('2'),
//       onTap: () {},
//       infoWindow: InfoWindow(title: "Your current Location"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     );
//     addMarkerToMarkersAndUpdateUI(currentLocationMarker);
//   }
//
//   void addMarkerToMarkersAndUpdateUI(Marker marker) {
//     setState(() {
//       markers.add(marker);
//     });
//   }
//
//   Widget buildDiretionsBloc() {
//     return BlocListener<MapsCubit, MapsState>(
//       listener: (context, state) {
//         if (state is DirectionsLoaded) {
//           placeDirections = (state).placeDirections;
//
//           getPolylinePoints();
//         }
//       },
//       child: Container(),
//     );
//   }
//
//   void getPolylinePoints() {
//     polylinePoints = placeDirections!.polylinePoints
//         .map((e) => LatLng(e.latitude, e.longitude))
//         .toList();
//   }
//
//   buildNoInternetWidget() {
//     return Center(
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "Can\'t Connect Check Internet ",
//               style: TextStyle(fontSize: 22, color: Colors.grey),
//             ),
//             Image.asset('assets/images/no_internet.png'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context1) {
//     return BlocProvider(
//       create: (context) => MapsCubit(MapsRepository(PlacesWebservices())),
//       child: BlocConsumer<MapsCubit, MapsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var cubobj = MapsCubit.get(context);
//           return Scaffold(
//               floatingActionButton: Padding(
//                 padding: const EdgeInsetsDirectional.only(
//                   bottom: 0,
//                 ),
//                 child: FloatingActionButton(
//                   onPressed: _goTomyCurrentLocation,
//                   child: Icon(Icons.place),
//                 ),
//               ),
//               body: OfflineBuilder(
//                 connectivityBuilder: (
//                   BuildContext context,
//                   ConnectivityResult connectivity,
//                   Widget child,
//                 ) {
//                   final bool connected =
//                       connectivity != ConnectivityResult.none;
//                   if (connected) {
//                     return Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         position != null
//                             ? buildMap()
//                             : Center(child: CircularProgressIndicator()),
//                         // buildFloatingSearchBar()
//                         FloatingSearchBar(
//                           controller: controller,
//                           elevation: 6,
//                           hintStyle:
//                               TextStyle(fontSize: 18, color: Colors.grey),
//                           queryStyle: TextStyle(fontSize: 18),
//                           hint: ' Find a Trash bin..',
//                           borderRadius: BorderRadius.circular(12),
//                           border: BorderSide(style: BorderStyle.none),
//                           margins: EdgeInsets.fromLTRB(20, 70, 20, 0),
//                           padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
//                           height: 52,
//                           iconColor: defaultColor,
//                           scrollPadding:
//                               const EdgeInsets.only(top: 16, bottom: 56),
//                           transitionDuration: const Duration(milliseconds: 600),
//                           transitionCurve: Curves.easeInOut,
//                           physics: const BouncingScrollPhysics(),
//                           openAxisAlignment: 0.0,
//                           debounceDelay: const Duration(milliseconds: 500),
//                           progress: progressIndicator,
//                           onQueryChanged: (query) {
//                             // getPlacesSuggestions(query);
//                             final sessionToken = Uuid().v4();
//                             BlocProvider.of<MapsCubit>(context)
//                                 .emitPlaceSuggestions(query, sessionToken);
//                             //   cubobj.emitPlaceSuggestions(query, sessionToken);
//                           },
//                           onFocusChanged: (_) {
//                             // hide distance and time row
//                             setState(() {
//                               isTimeAndDistanceVisible = false;
//                             });
//                           },
//                           transition: CircularFloatingSearchBarTransition(),
//                           actions: [
//                             FloatingSearchBarAction(
//                               showIfOpened: false,
//                               child: CircularButton(
//                                   icon: Icon(Icons.place, color: defaultColor),
//                                   onPressed: () {}),
//                             ),
//                           ],
//                           builder: (context, transition) {
//                             return ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   buildSuggestionsBloc(),
//                                   buildSelectedPlaceLocationBloc(),
//                                   buildDiretionsBloc(),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//
//                         isSearchedPlaceMarkerClicked
//                             ? DistanceAndTime(
//                                 isTimeAndDistanceVisible:
//                                     isTimeAndDistanceVisible,
//                                 placeDirections: placeDirections,
//                               )
//                             : Container(),
//                       ],
//                     );
//                   } else {
//                     return buildNoInternetWidget();
//                   }
//                 },
//                 child: Center(
//                     child: CircularProgressIndicator(
//                   color: defaultColor,
//                 )),
//               ));
//         },
//       ),
//     );
//   }
// }
//
//
// //-----------------------------------------------------------------------------------------
//
// /*

import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:smart_trash/home/mapscreen/repo/map_repo.dart';
import 'package:uuid/uuid.dart';

import '../../network/remote/location helper.dart';
import '../../style/color.dart';
import 'distance and time.dart';
import 'mapscubit/mapscubit.dart';
import 'mapscubit/mapsstates.dart';
import 'mapswidget.dart';
import 'models/Place_suggestion.dart';
import 'models/binsInfoModel.dart';
import 'models/place.dart';
import 'models/place_directions.dart';
import 'models/places_webservices.dart';

import 'dart:math' show asin, cos, pi, sin, sqrt;


class mapsscreen extends StatefulWidget {
  // const mapsscreen({Key? key}) : super(key: key);
  @override
  State<mapsscreen> createState() => _mapsscreenState();
}
class _mapsscreenState extends State<mapsscreen> {


  @override
  initState()
  {

    super.initState();
    getMyCurrentLocation();
    getCustomMarker();
    createWastyPolyLine();

  }
  Completer<GoogleMapController> _controller = Completer();
  FloatingSearchBarController controller = FloatingSearchBarController ();
  static Position? position ;

  Future<void> getMyCurrentLocation() async
  {
    position = await LocationHelper.getCurrentLocation();

    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {

      });
    });
  }
  static final CameraPosition _CameraPosition = CameraPosition
    (
      // target:LatLng(position!.latitude,position!.longitude)  ,
      target:LatLng(30.57584187910638, 31.00852943270204),
      bearing: 0.0,
      tilt:  0.0,
      zoom:14.0
  );

  var wastyMarker = HashSet<Marker>();
  late BitmapDescriptor  customMarker ;
  getCustomMarker() async{
    customMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/slogo.png" ,

    );
  }
  // var wastybin1 = 100 ;
  // var wastybin2 = 75 ;
  // var wastybin3 = 50 ;
  // var wastybin4 = 0 ;


  String formatDate(String inputDate) {
    final dateTime = DateTime.parse(inputDate);
    final format = DateFormat.yMMMd().add_jm();
    return format.format(dateTime);
  }

  // Widget RichTextWidget() =>
  // RichText(
  // text:TextSpan(
  //  text: "Hello World " ,
  //  style: TextStyle(color:Colors.red,) ,
  //   children:<TextSpan> [
  //    TextSpan(
  //   text: "Hello World " ,
  //    style: TextStyle(color:Colors.red,) ,
  //   ),
  //   ],
  // ), ) ;


  //Calculate The Distance

  double calculateDistance(LatLng location1, LatLng location2) {
    const double earthRadius = 6371; // in kilometers

    double dLat = _degreesToRadians(location2.latitude - location1.latitude);
    double dLon = _degreesToRadians(location2.longitude - location1.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(location1.latitude)) *
            cos(_degreesToRadians(location2.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * asin(sqrt(a));

    double distance = earthRadius * c;
    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

 // End Of Calculate The Distance

// double status1 = 100 ;
// double status2 = 100 ;
// double status3 = 20 ;
// double status4 = 100 ;

LatLng bin1 = LatLng(30.57584187910638, 31.00852943270204);
LatLng bin2 = LatLng(30.57748108747756, 31.013985531957832);
LatLng bin3 = LatLng(30.57317088334517, 31.00561590882143);
LatLng bin4 = LatLng(30.552191995974688, 31.008542079719163);

double calculateDistanceForBin1()
{
  double binId1 =1 ;
  double distance = calculateDistance(bin1, LatLng(position!.latitude,position!.longitude) );
  String formattedDistance = distance.toStringAsFixed(2);
  double finalDistance = double.parse(formattedDistance);
  print("Distance for bin1 Is ${finalDistance }");
  return finalDistance + binId1 ;


}
  double calculateDistanceForBin2()
  {
    double distance = calculateDistance(bin2, LatLng(position!.latitude,position!.longitude) );
    String formattedDistance = distance.toStringAsFixed(2);
    double finalDistance = double.parse(formattedDistance);
    print("Distance for bin2 Is ${finalDistance}");
    return finalDistance ;

  }
  double calculateDistanceForBin3()
  {
    double distance = calculateDistance(bin3, LatLng(position!.latitude,position!.longitude) );
    String formattedDistance = distance.toStringAsFixed(2);
    double finalDistance = double.parse(formattedDistance);
    print("Distance for bin3 IS ${finalDistance}");
    return finalDistance ;

  }
  double calculateDistanceForBin4()
  {
    double distance = calculateDistance(bin4, LatLng(position!.latitude,position!.longitude) );
    String formattedDistance = distance.toStringAsFixed(2);
    double finalDistance = double.parse(formattedDistance);
    print("Distance for bin4 Is ${finalDistance}");
    return finalDistance ;

  }


  // double findSmallestBinsDistance() {
  //    double smallest = 1000000000;
  //
  //
  //   if (calculateDistanceForBin1() < smallest &&  status2 != 100 ) {
  //     smallest = calculateDistanceForBin1();
  //   }
  //
  //   if (calculateDistanceForBin2() < smallest &&  status2 != 100 ) {
  //     smallest = calculateDistanceForBin2();
  //   }
  //
  //   if (calculateDistanceForBin3() < smallest &&  status3 != 100) {
  //     smallest = calculateDistanceForBin3();
  //   }
  //   if (calculateDistanceForBin4() < smallest &&  status4 != 100) {
  //     smallest = calculateDistanceForBin4();
  //   }
  //
  //   return smallest ;
  // }

  Map<String, dynamic> findSmallestBinsDistance() {
    Map<String, double> distances = {
      'Bin 1': calculateDistanceForBin1(),
      'Bin 2': calculateDistanceForBin2(),
      'Bin 3': calculateDistanceForBin3(),
      'Bin 4': calculateDistanceForBin4(),
    };

    double smallest = double.infinity;
    String smallestBin = '';
    double smallestLatitude = 0;
    double smallestLongitude = 0;

    distances.forEach((bin, distance) {
      int status = getBinStatus(bin)!; // Get the status of the bin
      if (distance < smallest  && status != 100) {
        smallest = distance;
        smallestBin = bin;
        smallestLatitude = getBinLatitude(bin);
        smallestLongitude = getBinLongitude(bin);
      }
    });

    return {
      'smallestDistance': smallest,
      'smallestBin': smallestBin,
      'smallestLatitude': smallestLatitude,
      'smallestLongitude': smallestLongitude,
    };
  }

  int? getBinStatus(String bin) {
    // Retrieve the status of the bin based on your logic
    // Replace this with your actual logic to fetch the bin status

    // For example, assume the status is stored in a Map:
    Map<String, int> binStatuses = {
      'Bin 1': 10,
      'Bin 2': 20,
      'Bin 3': 70,
      'Bin 4': 100,
    };

    // Retrieve the status from the Map based on the bin name
    return binStatuses[bin];
  }

  double getBinLatitude(String bin) {
    // Retrieve the latitude of the bin based on your logic
    // Replace this with your actual logic to fetch the bin latitude

    // For example, assume the latitude is stored in a Map:
    Map<String, double> binLatitudes = {
      'Bin 1': 30.57584187910638,
      'Bin 2': 30.57748108747756,
      'Bin 3': 30.57317088334517,
      'Bin 4': 30.552191995974688,
    };

    // Retrieve the latitude from the Map based on the bin name
    return binLatitudes[bin] ?? 0;
  }

  double getBinLongitude(String bin) {
    // Retrieve the longitude of the bin based on your logic
    // Replace this with your actual logic to fetch the bin longitude

    // For example, assume the longitude is stored in a Map:
    Map<String, double> binLongitudes = {
      'Bin 1': 31.00852943270204,
      'Bin 2': 31.013985531957832,
      'Bin 3': 31.00561590882143,
      'Bin 4': 31.008542079719163,
    };

    // Retrieve the longitude from the Map based on the bin name
    return binLongitudes[bin] ?? 0;
  }











  //Map<String, dynamic> smallestDistanceResult = findSmallestBinsDistance();
  //dynamic smallestDistanceResult = findSmallestBinsDistance(smallestDistanceResult['smallestDistance']!);

  // double smallestDistance = smallestDistanceResult['smallestDistance']!;
  // String smallestBin = smallestDistanceResult['smallestBin']!;
  // double smallestLatitude = smallestDistanceResult['smallestLatitude'] as double;
  // double smallestLongitude = smallestDistanceResult['smallestLongitude'] as double;


List<Polyline> wastyPolyLine = [] ;

createWastyPolyLine()
{
  Map<String, dynamic> smallestDistanceResult = findSmallestBinsDistance();

  double smallestDistance = smallestDistanceResult['smallestDistance'] as double;
  String smallestBin = smallestDistanceResult['smallestBin'] as String;
  double smallestLatitude = smallestDistanceResult['smallestLatitude'] as double;
  double smallestLongitude = smallestDistanceResult['smallestLongitude'] as double;
  wastyPolyLine.add(
      Polyline(
          polylineId:PolylineId('bin1')
          , color:Colors.black ,
        width: 3 ,
        points: [LatLng(position!.latitude,position!.longitude) ,LatLng(smallestLatitude, smallestLongitude) ] ,
        patterns: [PatternItem.dash(20) ,PatternItem.gap(10)]
      )
  );
}

  Widget buildMap (context  ,  BinsInfoModel info )
  {
    return GoogleMap(
      initialCameraPosition: _CameraPosition ,
      mapType: MapType.normal,
      myLocationEnabled: true,
      //markers:markers ,
      markers: wastyMarker,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller)
      {
        _controller.complete(controller);
        setState(() {
          wastyMarker.add(
            Marker(
                markerId: MarkerId('1'),
                //position: LatLng(30.57584187910638, 31.00852943270204),
                position: bin1,
                infoWindow: InfoWindow(
                   //title: 'Wasty ',
                   title: "Wasty bin is ${info.BinsDataList[0].status}% Full.",
                   snippet: 'Last Update :${formatDate("${info.BinsDataList[0].createdAt}")} ' ,
                  //snippet: 'Last Update :${DateFormat.yMMMd().format( )} ' ,
                  // snippet: 'Last Update :${DateTime.tryParse("${info.BinsDataList[0].createdAt}")} ' ,
                  //snippet: 'Last Update :${DateTime.tryParse("2023-05-06T10:19:10.621Z")} ' ,
                  // snippet: 'Last Update :${ DateFormat.yMd().format("2023-05-06T10:19:10.621Z")}")} ' ,


                ),
                onTap: (){
                  //Get Data From Api

                  setState(() {

                    // BlocProvider.of<MapsCubit>(context).getBinsInfo();
                   // print(BlocProvider.of<MapsCubit>(context).binsInfoModel!.success);
                   //
                   //  print(info!.BinsDataList[0].updatedAt);
                   //  print(info.BinsDataList[0].createdAt);

                    /* double distance = calculateDistance(bin1, LatLng(position!.latitude,position!.longitude) );
                    //print('Distance: ${distance.toStringAsFixed(2)} km');

                    String formattedDistance = distance.toStringAsFixed(2);
                    double roundedDistance = double.parse(formattedDistance);

                    print(roundedDistance);
                    */

                    // print( findSmallestBinsDistance());


                    Map<String, dynamic> smallestDistanceResult = findSmallestBinsDistance();

                    double smallestDistance = smallestDistanceResult['smallestDistance']!;
                    String smallestBin = smallestDistanceResult['smallestBin']!;
                    double smallestLatitude = smallestDistanceResult['smallestLatitude'] as double;
                    double smallestLongitude = smallestDistanceResult['smallestLongitude'] as double;
                    print('Smallest Latitude: $smallestLatitude');
                    print('Smallest Longitude: $smallestLongitude');

                    print('Smallest Distance: $smallestDistance');
                    print('Smallest Bin: $smallestBin');

                  });
                },
                icon:customMarker
            ),
          );
          wastyMarker.add(
            Marker(
                markerId: MarkerId('2'),
                //position: LatLng(30.57748108747756, 31.013985531957832),
                position: bin2,
                infoWindow: InfoWindow(
                  title: "Wasty bin is ${info.BinsDataList[1].status}% Full.",
                  snippet: 'Last Update :${formatDate("${info.BinsDataList[1].createdAt}")} ' ,
                ),
                onTap: (){
                  //Get Data From Api
                  setState(() {

                  });

                },
                icon:customMarker

            ),
          );
          wastyMarker.add(
            Marker(
                markerId: MarkerId('3'),
                //position: LatLng(30.57317088334517, 31.00561590882143),
                position: bin3,
                infoWindow: InfoWindow(
                  title: "Wasty bin is ${info.BinsDataList[2].status}% Full.",
                  snippet: 'Last Update :${formatDate("${info.BinsDataList[2].createdAt}")} ' ,
                ),
                onTap: (){
                  setState(() {
                  });
                  //Get Data From Api
                },
                icon:customMarker
            ),
          );
          wastyMarker.add(
            Marker(
                markerId: MarkerId('4'),
                //position: LatLng(30.552191995974688, 31.008542079719163),
                position: bin4,
                infoWindow: InfoWindow(
                  title: "Wasty bin is ${info.BinsDataList[2].status}% Full.",
                  snippet: 'Last Update :${formatDate("${info.BinsDataList[2].createdAt}")} ' ,
                ),
                onTap: (){
                  //Get Data From Api
                  setState(() {
                  });
                },
                icon:customMarker

            ),
          );
        });


      },
       polylines: wastyPolyLine.toSet(),
      // polylines: placeDirections != null
      //     ? {
      //   Polyline(
      //     polylineId: const PolylineId('my_polyline'),
      //     color: Colors.black,
      //     width: 4,
      //     points: polylinePoints,
      //   ),
      // }
      //     : {},

    );
  }


  Future<void>  _goTomyCurrentLocation() async
  {
    final GoogleMapController controller = await _controller.future ;
    controller.animateCamera(CameraUpdate.newCameraPosition(_CameraPosition));
  }


  List<PlaceSuggestion> places = [];


  // these variables for getPlaceLocation

  Set<Marker> markers = Set();
  late PlaceSuggestion placeSuggestion;
  late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;


  // these variables for getDirections
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;

  void buildCameraNewPosition() {
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
      zoom: 15,
    );
  }

  void getSelectedPlaceLocation(context) {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(context)
        .emitPlaceLocation(placeSuggestion.placeId, sessionToken);

  }


  Widget buildPlacesList() {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () async {
              placeSuggestion = places[index];
              controller.close();
              getSelectedPlaceLocation(ctx);
              polylinePoints.clear();
              removeAllMarkersAndUpdateUI();
            },
            child: PlaceItem(
              suggestion: places[index],
            ),
          );
        },
        itemCount: places.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics());
  }

  void removeAllMarkersAndUpdateUI() {
    setState(() {
      markers.clear();
    });
  }


  Widget buildSuggestionsBloc() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places = (state).places;
          if (places.length != 0) {
            return buildPlacesList();
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }


  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationLoaded) {
          selectedPlace = (state).place;

          goToMySearchedForLocation();
          getDirections(context);
        }
      },
      child: Container(),
    );
  }

  void getDirections(context) {
    BlocProvider.of<MapsCubit>(context).emitPlaceDirections(
      LatLng(position!.latitude, position!.longitude),
      LatLng(selectedPlace.result.geometry.location.lat,
          selectedPlace.result.geometry.location.lng),
    );
  }

  Future<void> goToMySearchedForLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller2 = await _controller.future;
    controller2
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));
    buildSearchedPlaceMarker();
  }


  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlace.target,
      markerId: MarkerId('1'),
      onTap: () {
        buildCurrentLocationMarker();
        // show time and distance
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(title: "${placeSuggestion.description}"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: MarkerId('2'),
      onTap: () {},
      infoWindow: InfoWindow(title: "Your current Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    addMarkerToMarkersAndUpdateUI(currentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }




  Widget buildDiretionsBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is DirectionsLoaded) {
          placeDirections = (state).placeDirections;

          getPolylinePoints();
        }
      },
      child: Container(),
    );
  }


  void getPolylinePoints() {
    polylinePoints = placeDirections!.polylinePoints
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();
  }

  buildNoInternetWidget()
  {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,) ,
            Text("Can\'t Connect Check Internet " , style: TextStyle(
                fontSize: 22 ,
                color: Colors.grey
            ),
            ) ,
            Image.asset('assets/images/no_internet.png') ,


          ],
        ),

      ),
    );
  }


  @override
  Widget build(BuildContext context1) {
    return BlocProvider(
      create: (context)=>MapsCubit(MapsRepository(PlacesWebservices()))..getBinsInfo(),
      child: BlocConsumer<MapsCubit , MapsState>(
        listener: (context , state){},
        builder: (context , state){
          var cubobj = MapsCubit.get(context);
          if (state is! BinsInfoState)
            {
              return Center(child: CircularProgressIndicator());
            }
          else
            {
              return Scaffold(
                  floatingActionButton: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 0 ,
                    ),
                    child: FloatingActionButton(
                      onPressed: _goTomyCurrentLocation,
                      child: Icon(Icons.place),
                    ),
                  ),
                  body: OfflineBuilder(
                    connectivityBuilder: (
                        BuildContext context,
                        ConnectivityResult connectivity,
                        Widget child,
                        ){
                      final bool connected = connectivity != ConnectivityResult.none;
                      if(connected )
                      {
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            position!=null ? buildMap(context , cubobj.binsInfoModel!) : Center(child: CircularProgressIndicator()) ,
                            // buildFloatingSearchBar()
                            FloatingSearchBar(
                              controller: controller,
                              elevation: 6,
                              hintStyle: TextStyle(fontSize: 18 , color: Colors.grey),
                              queryStyle: TextStyle(fontSize: 18),
                              hint: ' Find a Trash bin..' ,
                              borderRadius: BorderRadius.circular(12),
                              border: BorderSide(style: BorderStyle.none),
                              margins: EdgeInsets.fromLTRB(20, 70, 20, 0),
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              height: 52,
                              iconColor: defaultColor,
                              scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                              transitionDuration: const Duration(milliseconds: 600),
                              transitionCurve: Curves.easeInOut,
                              physics: const BouncingScrollPhysics(),
                              openAxisAlignment: 0.0,
                              debounceDelay: const Duration(milliseconds: 500),
                              progress: progressIndicator,
                              onQueryChanged: (query) {
                                // getPlacesSuggestions(query);
                                final sessionToken = Uuid().v4();
                                BlocProvider.of<MapsCubit>(context)
                                    .emitPlaceSuggestions(query, sessionToken);
                                //   cubobj.emitPlaceSuggestions(query, sessionToken);
                              },
                              onFocusChanged: (_) {
                                // hide distance and time row
                                setState(() {
                                  isTimeAndDistanceVisible = false;
                                });
                              },
                              transition: CircularFloatingSearchBarTransition(),
                              actions: [
                                FloatingSearchBarAction(
                                  showIfOpened: false,
                                  child: CircularButton(
                                      icon: Icon(Icons.place, color: defaultColor),
                                      onPressed: () {}),
                                ),
                              ],
                              builder: (context, transition) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildSuggestionsBloc(),
                                      buildSelectedPlaceLocationBloc(),
                                      buildDiretionsBloc(),
                                    ],
                                  ),
                                );
                              },
                            ) ,

                            isSearchedPlaceMarkerClicked
                                ? DistanceAndTime(
                              isTimeAndDistanceVisible: isTimeAndDistanceVisible,
                              placeDirections: placeDirections,
                            )
                                : Container(),
                          ],
                        );

                      }
                      else
                      {
                        return buildNoInternetWidget();

                      }
                    }
                    ,
                    child: Center(child: CircularProgressIndicator(color: defaultColor,)),
                  )
              );
            }

        },
      ),
    );
  }

}





