
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:smart_trash/home/mapscreen/repo/map_repo.dart';
import 'package:uuid/uuid.dart';

import '../../network/remote/location helper.dart';
import '../../style/color.dart';
import 'distance and time.dart';
import 'mapscubit/mapscubit.dart';
import 'mapscubit/mapsstates.dart';
import 'mapswidget.dart';
import 'models/Place_suggestion.dart';
import 'models/place.dart';
import 'models/place_directions.dart';
import 'models/places_webservices.dart';

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
      target:LatLng(position!.latitude,position!.longitude)  ,
      bearing: 0.0,
      tilt:  0.0,
      zoom:14.0
  );
  Widget buildMap ()
  {
    return GoogleMap(
      initialCameraPosition: _CameraPosition ,
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: markers,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller)
      {
        _controller.complete(controller);
      },
      polylines: placeDirections != null
          ? {
        Polyline(
          polylineId: const PolylineId('my_polyline'),
          color: Colors.black,
          width: 4,
          points: polylinePoints,
        ),
      }
          : {},

    );
  }


  Future<void>  _goTomyCurrentLocation() async
  {
    final GoogleMapController controller = await _controller.future ;
    controller.animateCamera(CameraUpdate.newCameraPosition(_CameraPosition));
  }



  // Widget buildFloatingSearchBar() {
  //   final isPortrait =
  //       MediaQuery.of(context).orientation == Orientation.portrait;
  //
  //   return FloatingSearchBar(
  //     controller: controller,
  //     elevation: 6,
  //     hintStyle: TextStyle(fontSize: 18 , color: Colors.grey),
  //     queryStyle: TextStyle(fontSize: 18),
  //     hint: ' Find a Trash bin..' ,
  //     borderRadius: BorderRadius.circular(12),
  //     border: BorderSide(style: BorderStyle.none),
  //     margins: EdgeInsets.fromLTRB(20, 70, 20, 0),
  //     padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
  //     height: 52,
  //     iconColor: defaultColor,
  //     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
  //     transitionDuration: const Duration(milliseconds: 600),
  //     transitionCurve: Curves.easeInOut,
  //     physics: const BouncingScrollPhysics(),
  //     axisAlignment: isPortrait ? 0.0 : -1.0,
  //     openAxisAlignment: 0.0,
  //     width: isPortrait ? 600 : 500,
  //     debounceDelay: const Duration(milliseconds: 500),
  //     // progress: progressIndicator,
  //     onQueryChanged: (query) {
  //       // /getPlacesSuggestions(query);
  //       final sessionToken = Uuid().v4();
  //       BlocProvider.of<MapsCubit>(context)
  //           .emitPlaceSuggestions(query, sessionToken);
  //     },
  //     onFocusChanged: (_) {
  //       // hide distance and time row
  //       // setState(() {
  //       //   isTimeAndDistanceVisible = false;
  //       // });
  //     },
  //     transition: CircularFloatingSearchBarTransition(),
  //     actions: [
  //       FloatingSearchBarAction(
  //         showIfOpened: false,
  //         child: CircularButton(
  //             icon: Icon(Icons.place, color: defaultColor),
  //             onPressed: () {}),
  //       ),
  //     ],
  //     builder: (context, transition) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             buildSuggestionsBloc(),
  //             // buildSelectedPlaceLocationBloc(),
  //             // buildDiretionsBloc(),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }






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
      create: (context)=>MapsCubit(MapsRepository(PlacesWebservices())),
      child: BlocConsumer<MapsCubit , MapsState>(
        listener: (context , state){},
        builder: (context , state){
          var cubobj = MapsCubit.get(context);
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
                  position!=null ? buildMap() : Center(child: CircularProgressIndicator()) ,
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
        },
      ),
    );
  }

}
