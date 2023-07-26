import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/components/cards/map_detail_card.dart';
import 'package:akademi_bootcamp/core/constants/api/api_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/core/model/group_model.dart';
import 'package:akademi_bootcamp/product/map/mapbox_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';
import '../../core/constants/image/image_constants.dart';

class MapBoxView extends StatefulWidget {
  const MapBoxView({super.key});

  @override
  State<MapBoxView> createState() => _MapBoxViewState();
}

class _MapBoxViewState extends BaseState<MapBoxView> {
  MapBoxViewModel _viewModel = MapBoxViewModel();
  @override
  void initState() {
    _viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                maxZoom: 18,
                minZoom: 9,
                zoom: 11,
                center: _viewModel.currentPosition != null ? LatLng(_viewModel.currentPosition!.latitude, _viewModel.currentPosition!.longitude) : _viewModel.mapCenter),
            nonRotatedChildren: [
              TileLayer(
                urlTemplate: "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                additionalOptions: {'accessToken': ApiConstants.MAPBOX_ACCESS_TOKEN, 'id': _viewModel.MAPBOX_STYLE},
              ),
              _viewModel.currentPosition != null
                  ? MarkerLayer(markers: [Marker(point: LatLng(_viewModel.currentPosition!.latitude, _viewModel.currentPosition!.longitude), builder: (context) => userLocationMarker())])
                  : MarkerLayer(),
              MarkerLayer(markers: _viewModel.markerList)
            ],
          ),
          detailCardPageView(_viewModel.markerList)
        ],
      );
    }));
  }

  Positioned detailCardPageView(List<Marker> _markers) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      height: deviceHeight * 0.34,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _viewModel.pageController,
        itemCount: _markers.length,
        itemBuilder: (context, index) {
          final item = _viewModel.groupList[index];
          return MapDetailCard(group: item, favCount: item.favCount ?? 0);
        },
      ),
    );
  }

  Container userLocationMarker() {
    return Container(
      child: Icon(Icons.location_pin, size: 30, color: AppColors.lightblue),
    );
  }

  Widget otherMarkers() {
    return Container();
  }
}

class LocationMarker extends StatelessWidget {
  final GroupModel group;
  final bool isSelected;
  const LocationMarker({super.key, this.isSelected = false, required this.group});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: 30,
        width: 30,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
        child: Image.asset(group.event?.markerIcon ?? ImageConstants.HOME),
      ),
    );
  }
}
