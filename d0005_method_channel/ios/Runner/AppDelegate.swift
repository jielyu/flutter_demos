import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery", binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      print(call.method)
      if ("getBatteryLevel" == call.method) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery info unavailable",
                                details: nil))
        } else {
            print(device.batteryLevel)
            result(Int(device.batteryLevel * 100))
        }
      } else if ("computeNativeAddition" == call.method) {
        let arguments: [String: Any] = call.arguments as! [String: Any]
        let a: Int = arguments["a"] as! Int
        let b: Int = arguments["b"] as! Int
        let map = ["a": a, "b": b, "c": a + b]
        result(map)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
