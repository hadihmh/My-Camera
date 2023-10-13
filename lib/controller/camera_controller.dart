import 'dart:io';

import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class CameraController extends GetxController {
  //for creating path of image and video in storage
  Future<CaptureRequest> photoPathBuilder(List<Sensor> sensors) async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir = await Directory(
      '${extDir.path}/camerawesome',
    ).create(recursive: true);
    if (sensors.length == 1) {
      final String filePath =
          '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      return SingleCaptureRequest(filePath, sensors.first);
    } else {
      return MultipleCaptureRequest(
        {
          for (final sensor in sensors)
            sensor:
                '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
        },
      );
    }
  }

//for opening of image and video on gallery
  onMediaTap(MediaCapture mediaCapture) {
    OpenFile.open(
      mediaCapture.captureRequest.when(single: (single) => single.file?.path),
    );
  }
}
