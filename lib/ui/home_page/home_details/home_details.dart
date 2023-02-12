import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huis_light/media_quary/media_quary.dart';

import '../../../app_comp/large_btn.dart';
import '../../../app_comp/represent_function.dart';
import '../../../helper/app_colors/app_colors.dart';
import '../../../helper/static_values/static_values.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
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

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0xffdddddd).withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Delete Tebet? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "After the home is deleted, all members will be deleted, data will be emptied, and all devices will be unpaired.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontSize: 28,
                      fontSize: 15,
                      color: kGreyColor
                      // fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LargeBTN(
                  btnTitle: "Delete",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                LargeBTN(
                  btnTitle: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPostion == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
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
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => showBottomSheet(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.black,
                          ),
                          child: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset("assets/icons/delete.svg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tebet",
                    hintStyle: TextStyle(
                      color: kBlack,
                      decoration: TextDecoration.underline,
                      decorationColor: kPinkColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: TextStyle(
                    color: kBlack,
                    decoration: TextDecoration.underline,
                    decorationColor: kPinkColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Center(
                //   child: Text(
                //     "Tebet",

                // ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                      Expanded(
                        child: SingleTopOption(
                          icon: "electric.svg",
                          iconBottomText: "R",
                          title: "312",
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: SingleTopOption(
                          icon: "device.svg",
                          iconBottomText: "Devices",
                          title: "8",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Home address",
                      style: TextStyle(
                        color: kBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit",
                        // "See all",
                        style: TextStyle(
                          color: kPinkColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: kGrey1Color,
                    child: SizedBox(
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
                              child: Center(
                                child: Text(
                                  "Jl. Flamboyan, Jakarta Selatan, Indonesia",
                                  style: TextStyle(
                                    color: kBlack,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                const RepresentFunction(
                  trailingTitle: "Select",
                  title: "Rooms",
                  lengthOfActiveDevice: 6,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: const [
                        SingleRoomHomeDetails(),
                        SingleRoomHomeDetails(),
                        SingleRoomHomeDetails(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                const RepresentFunction(
                  trailingTitle: "Invite member",
                  title: "Member",
                  lengthOfActiveDevice: 3,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                ListTile(
                  minVerticalPadding: 25,
                  dense: true,
                  onTap: () => showBottomSheet(),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/en/7/70/Shawn_Tok_Profile.jpg"),
                  ),
                  title: Text(
                    "George Martin",
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "george123@email.com",
                  ),
                ),
                ListTile(
                  minVerticalPadding: 25,
                  dense: true,
                  onTap: () {},
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/en/0/00/Wikipedia_profile_photo_%28User_KoRnOnThEeKoB%29.jpg"),
                  ),
                  title: Text(
                    "Richard Eddy",
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "richard@email.com",
                  ),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: kPinkColor,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 14,
                        color: kwhite,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => showBottomSheet(),
                  minVerticalPadding: 25,
                  dense: true,
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/a/af/Jackson_Taylor_Profile_Picture.jpg"),
                  ),
                  title: Text(
                    "Willie Engelmann",
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "gengelmaan23@email.com",
                  ),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: kPinkColor,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 14,
                        color: kwhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class SingleTopOption extends StatelessWidget {
  final String icon, iconBottomText, title;

  const SingleTopOption({
    super.key,
    required this.icon,
    required this.iconBottomText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: title == "\$212"
              ? const Color(0xff5B17EA)
              : title == "81"
                  ? const Color(0xff00C5C5)
                  : title == "312"
                      ? kYellowColor
                      : kPinkColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/$icon"),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        iconBottomText,
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        title == "\$212"?".20": title == "312" ? "kwh" : "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: kwhite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SingleRoomHomeDetails extends StatelessWidget {
  const SingleRoomHomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.02),
      height: SizeConfig.screenHeight! * 0.2,
      width: SizeConfig.screenWidth! * 0.3,
      decoration: BoxDecoration(
        color: kGrey1Color,
        borderRadius: BorderRadius.circular(borderRadiusValue),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusValue),
                  topRight: Radius.circular(borderRadiusValue),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://content.wepik.com/statics/2679643/empty-office-white-room-zoom-background-r-1201757360page1.jpg",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/icons/office_icon.svg"),
                Text(
                  "Office",
                  style: TextStyle(
                      color: kBlack, fontWeight: FontWeight.w700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
