import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gps_test_controller.dart';

class GpsTestView extends GetView<GpsTestController> {
 final GpsTestController locationController = Get.put(GpsTestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Obx(() {
          if (locationController.currentPosition.value == null) {
            return Text('Sedang mendapatkan lokasi...');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Latitude: ${locationController.currentPosition.value!.latitude}'),
                Text('Longitude: ${locationController.currentPosition.value!.longitude}'),
                // locationController.isAllowed.value
                //     ? Text('Anda berada di lokasi yang diizinkan.')
                //     : Text('Anda tidak ada di lokasi tersebut.'),
                ElevatedButton(
                  onPressed: locationController.handleAbsensi,
                  child: Text('Absen'),
                ),
                if (locationController.error.isNotEmpty)
                  Text(locationController.error.value, style: TextStyle(color: Colors.red)),
              ],
            );
          }
        }),
      ),
    );
  }
}
