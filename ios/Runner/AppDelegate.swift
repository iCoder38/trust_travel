import Flutter
import UIKit
import GoogleMaps  // Add this import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      // TODO: Add your Google Maps API key
      GMSServices.provideAPIKey("AIzaSyDK7pJq7eqwA7IGthgXlg2mEJmvC-WLVlE")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
