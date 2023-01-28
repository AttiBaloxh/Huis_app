import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class SingleHomeList extends StatefulWidget {
  final bool isScan;
  const SingleHomeList({super.key, required this.isScan});

  @override
  State<SingleHomeList> createState() => _SingleHomeListState();
}

class _SingleHomeListState extends State<SingleHomeList> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? currentPostion;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future _getUserLocation() async {
    await GeolocatorPlatform.instance.requestPermission();
    Position? position = await GeolocatorPlatform.instance.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );
    if (position != null) {
      LatLng newValue = LatLng(position.latitude, position.longitude);

      setState(() {
        currentPostion = newValue;
      });
    } else {}
  }

  List<String> images = [
    "https://upload.wikimedia.org/wikipedia/en/7/70/Shawn_Tok_Profile.jpg",
    "https://upload.wikimedia.org/wikipedia/en/0/00/Wikipedia_profile_photo_%28User_KoRnOnThEeKoB%29.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/a/af/Jackson_Taylor_Profile_Picture.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return currentPostion == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color:widget.isScan
                  ?kwhite: kGrey1Color,
              child: widget.isScan
                  ? SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                bottomLeft: Radius.circular(18),
                              ),
                              child: GoogleMap(
                                myLocationButtonEnabled: false,
                                // \: false,
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: false,
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
                                  const SizedBox(
                                    height: 12.0,
                                  ),
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
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Stack(
                                        children: List.generate(
                                          images.length,
                                          (index) {
                                            return Positioned(
                                              left: index * 20,
                                              child: CircleAvatar(
                                                radius: 17,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      images[index]),
                                                  radius: 15,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 220,
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
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  Stack(
                                    children: List.generate(
                                      images.length,
                                      (index) {
                                        return Positioned(
                                          right: index * 25,
                                          child: CircleAvatar(
                                            radius: 17,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  NetworkImage(images[index]),
                                              radius: 15,
                                            ),
                                          ),
                                        );
                                      },
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
