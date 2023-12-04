import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teknisi/main.dart';
import 'package:teknisi/services/ForGroundLocalNotification.dart';
import 'package:teknisi/ui/order.dart';
import 'package:teknisi/ui/profile/signup.dart';
import 'package:teknisi/ui/teknisi/history_teknisi.dart';

class FirebaseMessagingService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    // Request permission untuk menerima notifikasi
    await _firebaseMessaging.requestPermission();
    await FirebaseMessaging.instance.subscribeToTopic('berita');

    // Handler untuk notifikasi saat aplikasi berada di foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      showNotification(message);
      RemoteMessage? initial =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initial != null) {
        handleNotificationClick(initial);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteMessage? initial =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initial != null) {
        handleNotificationClick(initial);
      }
    });

    // // Handler untuk notifikasi saat aplikasi berada di background atau ditutup
  }

  static void showNotification(RemoteMessage message) {
    // Tampilkan notifikasi sesuai dengan pesan FCM yang diterima
    // Anda dapat menggunakan package lain seperti flutter_local_notifications
    // untuk menampilkan notifikasi secara custom
  }

  static void handleNotificationClick(RemoteMessage? message) {
    print('navigas');

    navigatorKey.currentState?.pushNamed('/home', arguments: message);
  }
}
