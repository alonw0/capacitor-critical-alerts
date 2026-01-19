import Foundation
import Capacitor
import UserNotifications

enum CriticalAlertsPermissions: String {
    case prompt
    case denied
    case granted
}

@objc(CriticalAlertsPlugin)
public class CriticalAlertsPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CriticalAlertsPlugin"
    public let jsName = "CriticalAlerts"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "checkPermissions", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "requestPermissions", returnType: CAPPluginReturnPromise)
    ]

    @objc override public func requestPermissions(_ call: CAPPluginCall) {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge, .criticalAlert]
        ) { granted, error in
            if let error = error {
                call.reject(error.localizedDescription)
                return
            }

            let result: CriticalAlertsPermissions = granted ? .granted : .denied
            call.resolve(["criticalAlerts": result.rawValue])
        }
    }

    @objc override public func checkPermissions(_ call: CAPPluginCall) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            var result: CriticalAlertsPermissions

            switch settings.criticalAlertSetting {
            case .notSupported, .disabled:
                result = .denied
            case .enabled:
                result = .granted
            @unknown default:
                result = .denied
            }

            // If notifications haven't been requested yet, check authorization status
            if settings.authorizationStatus == .notDetermined {
                result = .prompt
            }

            call.resolve(["criticalAlerts": result.rawValue])
        }
    }
}
