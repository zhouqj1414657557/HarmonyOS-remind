
import CommonConstants from '../constants/CommonConstants';

/**
 * This is a pop-up window tool class, which is used to encapsulate dialog code.
 * Developers can directly invoke the methods in.
 */
export class CommonUtils {
  /**
   * 确认取消弹窗
   */
  alertDialog(content:{message:string},Callback: Function) {
    AlertDialog.show({
      message: content.message,
      alignment: DialogAlignment.Bottom,
      offset: {
        dx: 0,
        dy: CommonConstants.DY_OFFSET
      },
      primaryButton: {
        value: '取消',
        action: () => {
          Callback({
            type:1
          })
        }
      },
      secondaryButton: {
        value: '确认',
        action: () => {
          Callback({
            type:2
          })
        }
      }
    });
  }


  /**
   * 日期选择
   */
  datePickerDialog(dateCallback: Function) {
    DatePickerDialog.show({
      start: new Date(),
      end: new Date(CommonConstants.END_TIME),
      selected: new Date(CommonConstants.SELECT_TIME),
      lunar: false,
      onAccept: (value: DatePickerResult) => {
        let year: number = Number(value.year);
        let month: number = Number(value.month) + CommonConstants.PLUS_ONE;
        let day: number = Number(value.day);
        let birthdate: string = `${year}-${this.padZero(month)}-${this.padZero(day)}`
        dateCallback(birthdate,[year, month, day]);
      }
    });
  }

  /**
   * 时间选择
   */
  timePickerDialog(dateCallback: Function) {
    TimePickerDialog.show({
      selected:new Date(CommonConstants.SELECT_TIME),
      useMilitaryTime: true,
      onAccept: (value: TimePickerResult) => {
        let hour: number = Number(value.hour);
        let minute: number = Number(value.minute);
        let time: string =`${this.padZero(hour)}:${this.padZero(minute)}`
        dateCallback(time,[hour, minute]);
      }
    });
  }
  padZero(value:number):number|string {
    return value < 10 ? `0${value}` : value;
  }

  /**
   * 文本选择
   */
  textPickerDialog(sexArray?: string[], sexCallback?: Function) {
    if (this.isEmpty(sexArray)) {
      return;
    }
    TextPickerDialog.show({
      range: sexArray,
      selected: 0,
      onAccept: (result: TextPickerResult) => {
        sexCallback(result.value);
      },
      onCancel: () => {
      }
    });
  }


  /**
   * Check obj is empty
   *
   * @param {object} obj
   * @return {boolean} true(empty)
   */
  isEmpty(obj: object | string): boolean {
    return obj === undefined || obj === null || obj === '';
  }

}

export default new CommonUtils();