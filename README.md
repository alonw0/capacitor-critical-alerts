# capacitor-critical-alerts

Capacitor plugin for requesting iOS Critical Alerts permission.

Critical alerts are notifications that can bypass Do Not Disturb and the ringer switch. They require a special entitlement from Apple.

Offical push-notification capacitor plugins doesnt let you request for critical alert permissions - after you get the permission you can send critical alerts using the offical plugin (add the required fields to the firebase push notification json)

```json
{  
   "aps":{  
       "alert": "This is a Critical Alert!",
       "badge": 1,
       "sound": {  
         "critical": 1,
         "name": "your_custom_sound.aiff",
         "volume": 1.0
        }
     }
}
```

## Install

```bash
npm install capacitor-critical-alerts
npx cap sync
```

## Local Development Install

To install the plugin locally during development:

```bash
# From your Capacitor app directory, install using the local path
npm install /path/to/capacitor-plugins/critical-alerts

# Sync with native projects
npx cap sync
```

Or using npm link:

```bash
# In the plugin directory
cd /path/to/capacitor-plugins/critical-alerts
npm link

# In your Capacitor app directory
npm link capacitor-critical-alerts
npx cap sync
```

## iOS Setup

Critical alerts require a special entitlement from Apple. You must:

1. Request the Critical Alerts entitlement from Apple via your developer account
2. Add the `com.apple.developer.usernotifications.critical-alerts` entitlement to your app

See [Apple's documentation](https://developer.apple.com/documentation/usernotifications/unnotificationsettings/criticalalertsetting) for more information.

## Android

Critical alerts are an iOS-only feature. On Android, this plugin will always return `granted`.

## Example

```typescript
import { CriticalAlerts } from 'capacitor-critical-alerts';

const requestCriticalAlerts = async () => {
  const status = await CriticalAlerts.checkPermissions();

  if (status.criticalAlerts !== 'granted') {
    const result = await CriticalAlerts.requestPermissions();
    console.log('Critical alerts permission:', result.criticalAlerts);
  }
};
```

Notice: The status will almost always start as denied and not as prompt.

## API

### requestPermissions()

```typescript
requestPermissions() => Promise<PermissionStatus>
```

Request permission to receive critical alerts.

**Returns:** `Promise<PermissionStatus>`

---

### checkPermissions()

```typescript
checkPermissions() => Promise<PermissionStatus>
```

Check permission status for critical alerts.

**Returns:** `Promise<PermissionStatus>`

---

### Interfaces

#### PermissionStatus

| Prop               | Type                                                        |
| ------------------ | ----------------------------------------------------------- |
| **`criticalAlerts`** | `'prompt' \| 'prompt-with-rationale' \| 'granted' \| 'denied'` |
# capacitor-critical-alerts
