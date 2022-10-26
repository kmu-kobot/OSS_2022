import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';

// 불이 발생하지 않은 평상시의 화면을 구성한다.
class FireOff extends StatefulWidget {
  @override
  State<FireOff> createState() => _FireOffState();
}

class _FireOffState extends State<FireOff> {
  @override
  void initState() {
    //notificatoin 설정
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initialzationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    var initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid, iOS: initialzationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectionNotification,
    );
    super.initState();
  }

  // notification을 클릭하면 /on화면으로 전환한다.
  Future<dynamic> selectionNotification(payload) async {
    Navigator.pushNamed(context, "/on");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("화재 발생 정보"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Icon(
                  Icons.block,
                  size: 90,
                  color: Colors.white,
                ),
                Text(
                  "화재 정보가 없습니다.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}