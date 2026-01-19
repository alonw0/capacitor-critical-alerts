package com.capacitorjs.plugins.criticalalerts;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CriticalAlerts")
public class CriticalAlertsPlugin extends Plugin {

    @PluginMethod
    public void requestPermissions(PluginCall call) {
        // Critical alerts are iOS-only, always return granted on Android
        JSObject result = new JSObject();
        result.put("criticalAlerts", "granted");
        call.resolve(result);
    }

    @PluginMethod
    public void checkPermissions(PluginCall call) {
        // Critical alerts are iOS-only, always return granted on Android
        JSObject result = new JSObject();
        result.put("criticalAlerts", "granted");
        call.resolve(result);
    }
}
