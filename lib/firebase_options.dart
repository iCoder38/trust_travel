import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:trust_travel/classes/screens/splash/splash.dart';
// import 'classes/phone_number_verification/phone_number.dart';
// import 'classes/welcome_page_view/welcome_page_view.dart';

RemoteMessage? initialMessage;
FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  // show notification alert ( banner )
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('User granted permission =====> ${settings.authorizationStatus}');
  }
  //
  //
  /*await Future.delayed(Duration(seconds: 2));
  String? token = await FirebaseMessaging.instance.getToken();

//   final token = await _firebaseMessaging.getToken();

  //
  //
 if (kDebugMode) {
    print('=============> HERE IS MY DEVICE TOKEN <=============');
    print('======================================================');
    print(token);
    print('======================================================');
    print('======================================================');
  }
  // save token locally
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('deviceToken', token.toString());*/
  //

  // background access
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // foreground access
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    MaterialApp(
      //
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // routes: {
      //   'phone': (context) => const PhoneNumberValidationScreen(),
      //   // 'verify': (context) => const MyVerify()
      // },
    ),
  );

  // runApp(const MyApp());
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}
