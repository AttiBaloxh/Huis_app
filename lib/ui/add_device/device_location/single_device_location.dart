import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class SingleDeviceLocation extends StatefulWidget {
  const SingleDeviceLocation({
    super.key,
  });

  @override
  State<SingleDeviceLocation> createState() => _SingleDeviceLocationState();
}

class _SingleDeviceLocationState extends State<SingleDeviceLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? currentPostion;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future _getUserLocation() async {
    setState(() {});
    await GeolocatorPlatform.instance.requestPermission();
    Position? position = await GeolocatorPlatform.instance.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );
    if (position != null) {
      LatLng newValue = LatLng(position.latitude, position.longitude);

      setState(() {
        currentPostion = newValue;
      });
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return currentPostion == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: kGrey1Color,
              child: SizedBox(
                height: 220,
                width: 240,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        child: GoogleMap(
                          myLocationButtonEnabled: false,
                          onMapCreated: (GoogleMapController controller) {
                            setState(() {
                              _controller.complete(controller);
                            });
                          },
                          initialCameraPosition: CameraPosition(
                            target: currentPostion!,
                            zoom: 11.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tebet",
                              style: TextStyle(
                                color: kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '6',
                                style: TextStyle(
                                  color: kBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Rooms',
                                    style: TextStyle(
                                      color: kGreyColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  3',
                                    style: TextStyle(
                                      color: kBlack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Member',
                                    style: TextStyle(
                                      color: kGreyColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
