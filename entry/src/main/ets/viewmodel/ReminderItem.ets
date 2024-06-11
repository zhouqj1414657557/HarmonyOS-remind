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
interface LocalDateTime {
  /**
   * Value of year.
   * @since 9
   * @syscap SystemCapability.Notification.ReminderAgent
   */
  year: number;
  /**
   * Value of month.
   * @since 9
   * @syscap SystemCapability.Notification.ReminderAgent
   */
  month: number;
  /**
   * Value of day.
   * @since 9
   * @syscap SystemCapability.Notification.ReminderAgent
   */
  day: number;
  /**
   * Value of hour.
   * @since 9
   * @syscap SystemCapability.Notification.ReminderAgent
   */
  hour: number;
  /**
   * Value of minute.
   * @since 9
   * @syscap SystemCapability.Notification.ReminderAgent
   */
  minute: number;
  /**
   * Value of second.
   * @since 9
   * @syscap SystemCapability.Notification.ReminderAgent
   */
  second?: number;
}

export default class ReminderItem {
  id: number = 0;
  remindType: reminderAgent.ReminderType = reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR; // 提醒类型为日历类型
  repeatMonths?: Array<number> = []; // 指明重复提醒的月份
  repeatDays?: Array<number> = []; // 指明重复提醒的日期
  dateTime?: LocalDateTime; // 指明重复提醒的日期
  title: string = ''; // 指明提醒标题
  /**
   * 指明提醒内容
   */
  content: string = '';
  timeInterval: number = 0; //执行延迟提醒间隔（单位：秒）
  snoozeTimes: number = 0; // 指明延迟提醒次数
  ringDuration: number = 0; // 指明响铃时长（单位：秒）
  notificationId: number = 0; /// 指明提醒使用的通知的ID号，相同ID号的提醒会覆盖
}