import 'package:flutter/material.dart';
import 'package:huis_light/models/single_room.dart';

class SecurityCamera extends StatelessWidget {
  final SingleActiveRoom singleActiveRoom;
  const SecurityCamera({super.key, required this.singleActiveRoom});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 240,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(singleActiveRoom.title),
                  ),
                ),
                child: Image.asset("assets/images/camera_on.png"),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color.fromRGBO(240, 240, 240, 0.9),
                child:  Center(
                  child: Text(
                    singleActiveRoom.subTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
