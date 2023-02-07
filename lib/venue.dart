import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaipursweets3/constant.dart';
import 'package:map_launcher/map_launcher.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({super.key});

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Venue"),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: AssetImage("assets/background.png"),
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.near_me, color: Colors.white),
                  title: Text(
                    venue,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appColor.shade600),
                        onPressed: () {
                          openMapsSheet(context);
                          Get.back();
                        },
                        child: const Text(
                          'Explore in Map',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  openMapsSheet(context) async {
    try {
      final coords = Coords(-33.8222055, 151.0087269);
      final availableMaps = await MapLauncher.installedMaps;
      availableMaps[0].showMarker(
        coords: coords,
        title: appName,
      );
    } catch (e) {
      Get.snackbar(e.toString(), ".");
      printInfo(info: e.toString());
    }
  }
}
