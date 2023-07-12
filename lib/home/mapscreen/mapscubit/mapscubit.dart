
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_trash/home/mapscreen/models/binsInfoModel.dart';
import 'package:smart_trash/network/remote/Dio_bins.dart';
import '../../../network/End_Points.dart';
import '../repo/map_repo.dart';
import 'mapsstates.dart';
class MapsCubit extends Cubit<MapsState> {

  static MapsCubit get(context)
  {
    return BlocProvider.of(context);
  }

  final MapsRepository mapsRepository;

  MapsCubit(this.mapsRepository) : super(MapsInitial());

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepository.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepository.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepository.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }
BinsInfoModel? binsInfoModel ;
  void getBinsInfo()
  {
    BinsDioHelper.getData(
        url: binsInfo
    ).then((value) {
      // print(value.data);
      binsInfoModel = BinsInfoModel.fromJson(value.data);
      // print(binsInfoModel!.BinsDataList[0].updatedAt);
      emit(BinsInfoState());
    }).catchError((error){
      print("Error from info ${error}");
    });
  }
}