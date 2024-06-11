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

import reminderAgent from '@ohos.reminderAgentManager';
import notification from '@ohos.notificationManager';
import ReminderItem from '../viewmodel/ReminderItem';

/**
 * Base on ohos reminder agent service
 */
export default class ReminderService {
  /**
   * 打开弹窗
   */
  public openNotificationPermission() {
    notification.requestEnableNotification().then(() => {
    }).catch((err: Error) => {
    });
  }

  /**
   * 发布相应的提醒代理
   *
   * @param alarmItem ReminderItem
   * @param callback callback
   */
  public addReminder(alarmItem: ReminderItem, callback?: (reminderId: number) => void) {
    let reminder = this.initReminder(alarmItem);
    reminderAgent.publishReminder(reminder, (err, reminderId: number) => {
      if (callback != null) {
        callback(reminderId);
      }
    });
  }

  /**
   * 根据需要删除提醒任务。
   *
   * @param reminderId number
   */
  public deleteReminder(reminderId: number) {
    reminderAgent.cancelReminder(reminderId);
  }

  private initReminder(item: ReminderItem):  reminderAgent.ReminderRequestCalendar {
    return {
      reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
      title: item.title,
      content: item.content,
      dateTime: item.dateTime,
      repeatDays: item.repeatDays,
      ringDuration: item.ringDuration,
      snoozeTimes: item.snoozeTimes,
      timeInterval: item.timeInterval,
      actionButton: [
        {
          title: '关闭',
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE,
        },
        {
          title: '稍后提醒',
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
        },
      ],
      wantAgent: {
        pkgName: 'com.example.wuyandeduihua2',// 点击提醒通知后跳转的目标UIAbility信息
        abilityName: 'EntryAbility'
      },
      maxScreenWantAgent: { // 全屏显示提醒到达时自动拉起的目标UIAbility信息
        pkgName: 'com.example.wuyandeduihua2',
        abilityName: 'EntryAbility'
      },
      notificationId: item.notificationId,
      expiredContent: '消息已过期',
      snoozeContent: '确定要延迟提醒嘛',
      slotType: notification.SlotType.SERVICE_INFORMATION
    }
  }
}