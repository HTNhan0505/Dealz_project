import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyAZWAf_XFhV6ryKimg30s5GAE02QNg7CLQ")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
