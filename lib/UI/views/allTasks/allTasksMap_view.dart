import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nurisuman/UI/views/allTasks/allTasks_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'allTasks_view.dart';

class AllTasksMapView extends StatefulWidget {
  const AllTasksMapView({Key? key}) : super(key: key);

  @override
  State<AllTasksMapView> createState() => _AllTasksMapViewState();
}

class _AllTasksMapViewState extends State<AllTasksMapView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllTasksViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => AllTasksViewModel(context),
        builder: (context, model, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness
                      .dark), //прозрачность statusbar и установка тёмных иконок
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(
                      context); //расфокус textfield при нажатии на экран
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Scaffold(
                  extendBody: true,
                  extendBodyBehindAppBar: true,
                  appBar: model.sideMenu == false
                      ? customAppBar(context, model)
                      : null,
                  bottomNavigationBar: model.sideMenu == false
                      ? customBottomBar(context, model)
                      : null,
                  body: _allTasksMap(context, model),
                ),
              ));
        });
  }
}

_allTasksMap(BuildContext context, AllTasksViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllTasksView()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(229, 67, 45, 1),
                        Color.fromRGBO(255, 150, 143, 1),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 7),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'Задания списком',
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                height: 500,
                width: 350,
                child: const MapWidget()),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 80, right: 80),
              height: 40,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(1, 160, 226, 1),
                      Color.fromRGBO(104, 209, 253, 1),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 7),
                    )
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Подписки',
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  LatLng startLocation = const LatLng(55.751151, 37.621306);
  LatLng firstLocation = const LatLng(55.744573, 37.637626);
  LatLng secondLocation = const LatLng(55.748975, 37.608553);
  LatLng thirdLocation = const LatLng(55.757823, 37.631052);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  customMarkerInfo(name, desc, location) {
    return _customInfoWindowController.addInfoWindow!(
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        name,
                        style: const TextStyle(
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Separator(),
                      const SizedBox(height: 10),
                      Text(
                        desc,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      const Separator(),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        height: 30,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(1, 160, 226, 1),
                                Color.fromRGBO(104, 209, 253, 1),
                              ],
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 7),
                              )
                            ]),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Посмотреть',
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ],
      ),
      location,
    );
  }

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "images/icons/mapLocation.png",
    );

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(firstLocation.toString()),
      position: firstLocation, //position of marker
      onTap: () {
        customMarkerInfo(
            'Иванов Владимир Сергеевич',
            'Проснувшись однажды утром после беспокойного сна,...',
            firstLocation);
      },
      icon: markerbitmap, //Icon for Marker
    ));

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(secondLocation.toString()),
      position: secondLocation, //position of marker
      onTap: () {
        customMarkerInfo(
            'Иванов Владимир Сергеевич',
            'Проснувшись однажды утром после беспокойного сна,...',
            secondLocation);
      },
      icon: markerbitmap, //Icon for Marker
    ));

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(thirdLocation.toString()),
      position: thirdLocation, //position of marker
      onTap: () {
        customMarkerInfo(
            'Иванов Владимир Сергеевич',
            'Проснувшись однажды утром после беспокойного сна,...',
            thirdLocation);
      },
      icon: markerbitmap, //Icon for Marker
    ));

    setState(() {
      //refresh UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          onTap: (position) {
            _customInfoWindowController.hideInfoWindow!();
          },
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove!();
          },
          onMapCreated: (GoogleMapController controller) async {
            _customInfoWindowController.googleMapController = controller;
          },
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
          initialCameraPosition: CameraPosition(
            target: startLocation, //initial position
            zoom: 12.5, //initial zoom level
          ),
          markers: markers, //markers to show on map
          mapType: MapType.normal, //map type
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 140,
          width: 220,
          offset: 60,
        ),
      ],
    ));
  }
}
