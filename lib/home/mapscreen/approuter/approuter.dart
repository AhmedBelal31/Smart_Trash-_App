// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_trash/home/mapscreen/mapsscreen.dart';
//
// import '../../../constant/const.dart';
// import '../mapscubit/mapscubit.dart';
// import '../models/places_webservices.dart';
// import '../repo/map_repo.dart';
//
//
// class AppRouter {
//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case mapScreen :   return MaterialPageRoute(
//
//         builder: (_) => BlocProvider(
//           create: (BuildContext context) =>
//               MapsCubit(MapsRepository(PlacesWebservices())),
//
//           child: mapsscreen(),
//
//         ),
//       );
//
//
//
//
//   }
// }
// }