import UIKit
import Flutter
import YandexMapsMobile
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyASpY9b96-EOTpQsKUm9-gFeg4_k61zfBI")
    YMKMapKit.setApiKey("5d6635a4-578e-47dd-b911-7221fe7c81d2") // Your generated API key
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}