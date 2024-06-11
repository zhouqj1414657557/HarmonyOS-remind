/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ReminderService from '../model/ReminderService';
import CommonConstants from '../common/constants/CommonConstants';
import DataTypeUtils from '../common/utils/DataTypeUtils';
import { GlobalContext } from '../common/utils/GlobalContext';
import PreferencesHandler from '../model/database/PreferencesHandler';
import PreferencesListener from '../model/database/PreferencesListener';
import  {formDataType} from  '../viewmodel/AddNeedModel'
/**
 * Declare class of main view model.
 */
export default class MainViewModel {
  static instant: MainViewModel =new MainViewModel();
  private reminderService: ReminderService;
  private alarms: Array<formDataType>;

  private constructor() {
    this.alarms = new Array();
    this.reminderService = new ReminderService();
    this.reminderService.openNotificationPermission();
  }

  /**
   * Querying alarm task database tables.
   *
   * @param callback (alarms: Array<formDataType>) => void
   */
  private queryDatabaseAlarms(callback: (alarms: Array<formDataType>) => void) {
    let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
    preference.get(CommonConstants.ALARM_KEY).then((data: string) => {
      if (!DataTypeUtils.isNull(data)) {
        this.alarms = JSON.parse(data);
        callback(this.alarms);
      }
    })
  }

  /**
   * Refresh alarm task.
   *
   * @param callback (alarms: Array<AlarmItem>) => void
   */
  public queryAlarmsTasker(callback: (alarms: Array<formDataType>) => void) {
    let that = this;
    that.queryDatabaseAlarms(callback);
    let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
    preference.addPreferencesListener({
      onDataChanged() {
        that.queryDatabaseAlarms(callback);
      }
    } as PreferencesListener)
  }





}