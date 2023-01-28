import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSwitcherComp extends StatefulWidget {
  const SingleSwitcherComp({super.key});

  @override
  State<SingleSwitcherComp> createState() => _SingleSecurityCameraState();
}

class _SingleSecurityCameraState extends State<SingleSwitcherComp> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(240, 240, 240, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: const Text(
              "On",
              style: TextStyle(
                  color: Color.fromRGBO(234, 23, 99, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            trailing: CupertinoSwitch(
              value: state,
              onChanged: (value) {
                state = value;
                setState(
                  () {},
                );
              },
              activeColor: const Color.fromRGBO(234, 23, 99, 1),
            ),
          ),
          const Icon(
            Icons.router_outlined,
            color: Colors.red,
          ),
          const Text(
            "Routers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "connected",
                style: TextStyle(
                  color: Color.fromRGBO(128, 128, 128, 1),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}