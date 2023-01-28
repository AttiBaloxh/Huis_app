import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/icons_data/icons_data.dart';

class InviteMember extends StatelessWidget {
  const InviteMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
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
                  Text(
                    "Invite member",
                    style: TextStyle(
                      color: kBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 0.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "QR code",
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  "Refresh code",
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
            // const SizedBox(
            //   height: 12.0,
            // ),
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: kGrey1Color,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/scan.png"),
                  ),
                ),
                 const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Near the person you’d like to add? have them\nscan this code or use email invite.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Wrap(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "On their phone open Huis, then going to > ",
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.home,
                            color: kBlack,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const Center(
                        child: Text("Manage home > + > Scan QR invitation.")),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
            Text(
              "Email invite",
              style: TextStyle(
                color: kBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: flashWhite,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Email address",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: kPinkColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      inviteSendIcon,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              "After the person you invite accepts the invitation, they’ll appear in the member list.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
