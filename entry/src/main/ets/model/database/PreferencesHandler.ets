

import data_preferences from '@ohos.data.preferences';
import CommonConstants from '../../common/constants/CommonConstants';
import PreferencesListener from './PreferencesListener';

/**
 * Based on lightweight databases preferences handler.
 */
export default class PreferencesHandler {
  static instance: PreferencesHandler = new PreferencesHandler();
  private preferences: data_preferences.Preferences | null = null;
  private defaultValue = '';
  private listeners: PreferencesListener[];

  private constructor() {
    this.listeners = new Array();
  }

  /**
   * Configure PreferencesHandler.
   *
   * @param context Context
   */
  public async configure(context: Context) {
    this.preferences = await data_preferences.getPreferences(context, CommonConstants.PREFERENCE_ID);
    this.preferences.on('change', (data: Record<string, Object>) => {
      for (let preferencesListener of this.listeners) {
        preferencesListener.onDataChanged(data.key as string);
      }
    });
  }

  /**
   * Set data in PreferencesHandler.
   *
   * @param key string
   * @param value any
   */
  public async set(key: string, value: string) {
    if (this.preferences != null) {
      await this.preferences.put(key, value);
      await this.preferences.flush();
    }
  }

  /**
   * 获取数据
   *
   * @param key string
   * @param defValue any
   * @return data about key
   */
  public async get(key: string) {
    let data: string = '';
    if (this.preferences != null) {
      data = await this.preferences.get(key, this.defaultValue) as string;
    }
    return data;
  }

  /**
   * 删除数据
   *
   * @param key string
   * @param defValue any
   * @return data about key
   */
  public async delete(key: string) {
    if (this.preferences != null) {
       await this.preferences.delete(key);
    }
  }

  /**
   * Clear data in PreferencesHandler.
   */
  public clear() {
    if (this.preferences != null) {
      this.preferences.clear();
    }
  }

  /**
   * Add preferences listener in PreferencesHandler.
   *
   * @param listener PreferencesListener
   */
  public addPreferencesListener(listener: PreferencesListener) {
    this.listeners.push(listener);
  }
}