import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_app/Screens/Auth_Screens/Function_screen/recorder_screen.dart';

class CheckInternetConnection extends StatefulWidget {
  const CheckInternetConnection({super.key});

  @override
  State<CheckInternetConnection> createState() =>
      _CheckInternetConnectionState();
}

class _CheckInternetConnectionState extends State<CheckInternetConnection> {
  bool isConnectedToInternet = false;
  StreamSubscription? _internetConnectionStreamSubscription;
  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isConnectedToInternet = true;
            });
            break;
          case InternetStatus.disconnected:
            setState(() {
              isConnectedToInternet = false;
            });
            break;
          default:
            setState(() {
              isConnectedToInternet = false;
            });

            break;
        }
      },
    );
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isConnectedToInternet)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecorderScreen(),
                      ));
                },
                child: Icon(
                  Icons.wifi_rounded,
                  color: Colors.green.shade400,
                ),
              ),
            if (!isConnectedToInternet)
              Icon(
                Icons.wifi_off_rounded,
                color: Colors.red.shade400,
              ),
          ],
        ),
      ),
    );
  }
}
