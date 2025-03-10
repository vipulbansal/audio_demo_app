import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestMicrophonePermission(BuildContext context) async {
    PermissionStatus status = await Permission.microphone.request();

    if (status.isDenied) {
      _showPermissionDeniedSnackbar(context, "Microphone permission denied! Please enable it.");
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedSnackbar(context, "Microphone permission permanently denied! Open settings.");
      openAppSettings();
    }
  }

  static void _showPermissionDeniedSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Open Settings",
          onPressed: () {
            openAppSettings();
          },
        ),
      ),
    );
  }
}
