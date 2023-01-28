import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huis_light/app_comp/small_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/icons_data/icons_data.dart';
import 'package:huis_light/ui/setup_home/add_room.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final Completer<GoogleMapController> _controller = Completer();

  LatLng? currentPostion;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future _getUserLocation() async {
    await GeolocatorPlatform.instance.requestPermission();
    Position position = await GeolocatorPlatform.instance.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );
    if (position != null) {
      LatLng newValue = LatLng(position.latitude, position.longitude);

      setState(() {
        currentPostion = newValue;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    if (currentPostion == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "Edit address",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Select Home Name",
                                    border: InputBorder.none,
                                    suffixIcon: Transform.scale(
                                      scale: 0.5,
                                      child: SvgPicture.asset(searchIcon),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                // _getUserLocation();
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: kPinkColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: SvgPicture.asset(locationIcon),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SmallBTN(
                onPressed: () {
                  pushToNextPage(
                    context: context,
                    className: const AddRoom(),
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  }
}
