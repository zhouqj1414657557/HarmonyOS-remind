
import CommonConstants from '../common/constants/CommonConstants';
import ReminderService from '../model/ReminderService';
import DataTypeUtils from '../common/utils/DataTypeUtils';
import { GlobalContext } from '../common/utils/GlobalContext';
import PreferencesHandler from '../model/database/PreferencesHandler';

/**
 * Detail page view model description
 */
export default class DetailViewModel {
  static instant: DetailViewModel = new DetailViewModel();
  private reminderService: ReminderService;
  private alarms: Array<formDataType>;

  private constructor() {
    this.reminderService = new ReminderService();
    this.alarms = new Array<formDataType>();
  }

  /**
   * 设置提醒
   *
   * @param alarmItem AlarmItem
   */
  public async setAlarmRemind(alarmItem: formDataType) {

    let index = await this.findAlarmWithId(alarmItem.id);
    if (index !== CommonConstants.DEFAULT_NUMBER_NEGATIVE) {
      this.reminderService.deleteReminder(alarmItem.id);
    } else {
      index = this.alarms.length;
      alarmItem.notificationId = index;
      this.alarms.push(alarmItem);
    }
    alarmItem.dateTime={
      year: alarmItem.remindDay[0],
      month: alarmItem.remindDay[1],
      day: alarmItem.remindDay[2],
      hour: alarmItem.remindTime[0],
      minute: alarmItem.remindTime[1],
      second: 0
    }
    // @ts-ignore
    this.reminderService.addReminder(alarmItem, (newId: number) => {
      alarmItem.id = newId;
      this.alarms[index] = alarmItem;
      let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
      preference.set(CommonConstants.ALARM_KEY, JSON.stringify(this.alarms));

    })
  }

  /**
   * 删除提醒
   *
   * @param id number
   */
  public async removeAlarmRemind(id: number) {
    this.reminderService.deleteReminder(id);
    let index = await this.findAlarmWithId(id);
    if (index !== CommonConstants.DEFAULT_NUMBER_NEGATIVE) {
      this.alarms.splice(index, CommonConstants.DEFAULT_SINGLE);
    }
    let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
    preference.set(CommonConstants.ALARM_KEY, JSON.stringify(this.alarms));
  }

  private async findAlarmWithId(id: number) {
    let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
    let data = await preference.get(CommonConstants.ALARM_KEY);
    if (!DataTypeUtils.isNull(data)) {
      this.alarms = JSON.parse(data);
      for (let i = 0;i < this.alarms.length; i++) {
        if (this.alarms[i].id === id) {
          return i;
        }
      }
    }
    return CommonConstants.DEFAULT_NUMBER_NEGATIVE;
  }
}


export  interface  FormItemType{
  title:string;
  placeholder:string;
  type:string;
  key:string;
  isPicker:boolean;
  dicData?:string[]
  dicMap?:object
}


export  interface  formDataType{
  id:number;
  notificationId?:number;
  title:string;
  content:string;
  remindDay:number[];
  remindDay_text:string;
  remindTime:number[];
  remindTime_text:string;
  ringDuration:number;
  ringDuration_text:string;
  snoozeTimes:number;
  snoozeTimes_text:string;
  timeInterval:number;
  timeInterval_text:string;
  dateTime?:Object

}


export const FormList: Array<FormItemType> = [
  {
    title:"事项名称",
    placeholder:"请输入",
    key:"title",
    isPicker:false,
    type:"text"
  },
  {
    title:"事项描述",
    placeholder:"请输入",
    key:"content",
    isPicker:false,
    type:"text"
  },
  {
    title:"提醒日期",
    placeholder:"请选择",
    key:"remindDay",
    isPicker:true,
    type:"datePicker"
  },
  {
    title:"提醒时间",
    placeholder:"请选择",
    key:"remindTime",
    isPicker:true,
    type:"timePicker"
  },
  {
    title:"提醒时长",
    placeholder:"请选择",
    key:"ringDuration",
    isPicker:true,
    type:"TextPicker",
    dicData:['30秒','1分钟','5分钟'],
    dicMap:{
      '30秒':30,
      '1分钟':60,
      '5分钟':60*5,
    }
  },
  {
    title:"延迟提醒次数",
    placeholder:"请选择",
    key:"snoozeTimes",
    isPicker:true,
    type:"TextPicker",
    dicData:['1次','2次','3次','4次','5次','6次'],
    dicMap:{
      '1次':1,
      '2次':2,
      '3次':3,
      '4次':4,
      '5次':5,
      '6次':6,
    }
  },
  {
    title:"延迟提醒间隔",
    placeholder:"请选择",
    key:"timeInterval",
    isPicker:true,
    type:"TextPicker",
    dicData:['5分钟','10分钟','15分钟','30分钟'],
    dicMap:{
      '5分钟':5*60,
      '10分钟':10*60,
      '15分钟':15*60,
      '30分钟':15*60,
    }
  }
]
