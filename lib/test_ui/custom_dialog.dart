import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/static_values/static_values.dart';
import 'package:huis_light/media_quary/media_quary.dart';
import 'package:huis_light/ui/home_page/home_preview/home_preview.dart';
import 'package:huis_light/ui/home_page/invite_member/invite_member.dart';

class LogoutOverlay extends StatefulWidget {
  final bool alignTopCenter;
  final String firstTitle, secondTitle, firstIcon, secondIcon;

  const LogoutOverlay({
    super.key,
    required this.alignTopCenter,
    required this.firstTitle,
    required this.secondTitle,
    required this.firstIcon,
    required this.secondIcon,
  });

  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.08),
      child: Align(
        alignment: widget.alignTopCenter != true
            ? Alignment.topRight
            : Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation!,
            child: Container(
              height: widget.alignTopCenter != true ? 170.0 : 244,
              width: 240,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                color: kwhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  widget.alignTopCenter != true
                      ? AddDevice(
                          firstIcon: widget.firstIcon,
                          firstTitle: widget.firstTitle,
                          secondIcon: widget.secondIcon,
                          secondTitle: widget.secondTitle,
                        )
                      : const DropDownItemsBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownItemsBox extends StatefulWidget {
  const DropDownItemsBox({super.key});

  @override
  State<DropDownItemsBox> createState() => _DropDownItemsBoxState();
}

class _DropDownItemsBoxState extends State<DropDownItemsBox> {
  bool tabel = true;
  bool villa = false;
  bool device = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: ListTile(
              onLongPress: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
              onTap: () {
                setState(() {
                  tabel = true;
                  villa = false;
                  device = false;
                });
              },
              tileColor: tabel == true ? const Color(0xffccf3f3) : null,
              title: const Text(
                "Tebet",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: tabel == true
                  ? const Icon(
                      Icons.check_circle,
                      color: Color(0xff00C5C5),
                    )
                  : null,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: ListTile(
              onLongPress: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
              onTap: () {
                setState(() {
                  tabel = false;
                  villa = true;
                  device = false;
                });
              },
              tileColor: villa == true ? const Color(0xffccf3f3) : null,
              title: const Text(
                "Villa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: villa == true
                  ? const Icon(
                      Icons.check_circle,
                      color: Color(0xff00C5C5),
                    )
                  : null,
            ),
          ),
          const Divider(
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          Material(
            color: Colors.transparent,
            child: ListTile(
              onTap: () {
                setState(() {
                  tabel = false;
                  villa = false;
                  device = true;
                });
                pushToNextPage(
                  context: context,
                  className: const MangeHomeDevice(),
                );
              },
              onLongPress: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
              tileColor: device == true ? const Color(0xffccf3f3) : null,
              leading: const Text(
                "Add device",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/setting_icon.svg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddDevice extends StatefulWidget {
  final String firstTitle, secondTitle, firstIcon, secondIcon;
  const AddDevice(
      {super.key,
      required this.firstIcon,
      required this.firstTitle,
      required this.secondIcon,
      required this.secondTitle});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {},
            leading: Text(
              widget.firstTitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: SvgPicture.asset(
              "assets/icons/${widget.firstIcon}",
            ),
          ),
          const Divider(
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              setState(() {
                pushToNextPage(
                  context: context,
                  className: const InviteMember(),
                );
              });
            },
            leading: Text(
              widget.secondTitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: SvgPicture.asset(
              "assets/icons/${widget.secondIcon}",
            ),
          ),
        ],
      ),
    );
  }
}
