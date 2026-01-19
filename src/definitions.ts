import type { PermissionState } from '@capacitor/core';

export interface CriticalAlertsPlugin {
  /**
   * Request permission to receive critical alerts.
   *
   * Critical alerts are notifications that can bypass Do Not Disturb and
   * the ringer switch. They require a special entitlement from Apple.
   *
   * Only available on iOS. On Android, this will resolve with 'granted'.
   *
   * @since 1.0.0
   */
  requestPermissions(): Promise<PermissionStatus>;

  /**
   * Check permission status for critical alerts.
   *
   * Only available on iOS. On Android, this will resolve with 'granted'.
   *
   * @since 1.0.0
   */
  checkPermissions(): Promise<PermissionStatus>;
}

export interface PermissionStatus {
  /**
   * Permission state for critical alerts.
   *
   * @since 1.0.0
   */
  criticalAlerts: PermissionState;
}
