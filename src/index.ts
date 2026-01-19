import { registerPlugin } from '@capacitor/core';

import type { CriticalAlertsPlugin } from './definitions';

const CriticalAlerts = registerPlugin<CriticalAlertsPlugin>('CriticalAlerts');

export * from './definitions';
export { CriticalAlerts };
