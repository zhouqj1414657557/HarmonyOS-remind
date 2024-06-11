import router from '@ohos.router';

import  {FormList,FormItemType,formDataType} from  '../viewmodel/AddNeedModel'
import CommonUtils from '../common/utils/CommonUtils';
import addModel from '../viewmodel/AddNeedModel';

@Entry
@Component
struct AddNeedPage {
  @State formData:formDataType={
     id:0,
     title:"",
     content:"",
     remindDay:[], //日期
     remindDay_text:"",
     remindTime:[],//时间
     remindTime_text:"",
     ringDuration:0,
     ringDuration_text:"", //提醒时长
     snoozeTimes:0,
     snoozeTimes_text:"", //延迟提醒次数
     timeInterval:0,
     timeInterval_text:"", //延迟提醒间隔
  }
  private viewModel: addModel = addModel.instant;

  aboutToAppear() {
    let params = router.getParams() as Record<string, Object|undefined>;
    if (params !== undefined) {
      let alarmItem: formDataType = params.alarmItem as formDataType;
      if (alarmItem !== undefined) {
        this.formData =  {...alarmItem}
      }
    }
  }

  build() {
    Column() {
      Column(){
        ForEach(FormList,(item:FormItemType)=>{
          Row(){
            Row(){
              Text(item.title)
            }.width('35%')
            Row(){
              TextInput({ text: item.type.includes('Picker')?this.formData[`${item.key}_text`]: this.formData[item.key],placeholder: item.placeholder })
                .borderRadius(0)
                .enabled(item.isPicker?false:true) //禁用
                .backgroundColor('#ffffff')
                .onChange((value: string) => {
                  if(!item.type.includes('Picker')){
                    this.formData[item.key] = value;
                  }
                })
              Image($r('app.media.ic_arrow'))
                .visibility(item.isPicker?Visibility.Visible:Visibility.Hidden)
                .width($r('app.float.arrow_image_width'))
                .height($r('app.float.arrow_image_height'))
                .margin({ right: $r('app.float.arrow_right_distance') })

            }.width('65%').padding({right:15})
            .onClick(()=>{
              if(item.isPicker){
                switch (item.type) {
                  case 'datePicker':
                    CommonUtils.datePickerDialog((value: string,timeArray:string[]) => {
                      this.formData[`${item.key}_text`] = value;
                      this.formData[item.key] = timeArray;
                    });
                    break;
                  case 'timePicker':
                    CommonUtils.timePickerDialog((value: string,timeArray:string[]) => {
                      this.formData[`${item.key}_text`] = value;
                      this.formData[item.key] = timeArray;
                    });
                    break;
                  case 'TextPicker':
                    CommonUtils.textPickerDialog(item.dicData, (value: string) => {
                      this.formData[`${item.key}_text`] = value;
                      this.formData[`${item.key}`] =item.dicMap[value];
                    });
                    break;

                  default:
                    break;
                }
              }
            })
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .backgroundColor('#ffffff')
          .padding(10)
          .borderWidth({
            bottom:1
          })
          .borderColor('#f7f7f7')
        })

        Button('提交',{ type: ButtonType.Normal, stateEffect: true })
          .fontSize(18)
          .width('90%')
          .height(40)
          .borderRadius(15)
          .margin({ top:45 })
          .onClick(()=>{
            this.viewModel.setAlarmRemind(this.formData);
            router.back();
          })
      }
    }.width('100%')
    .height('100%')
    .backgroundColor('#f7f7f7')
  }
}