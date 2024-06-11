import router from '@ohos.router';
import  {formDataType} from  '../../viewmodel/AddNeedModel'
import NeedModel from '../../viewmodel/NeedListModel';
import addModel from '../../viewmodel/AddNeedModel';
import CommonUtils from '../../common/utils/CommonUtils';

@Component
export struct NeedList {
  private mainModel: NeedModel = NeedModel.instant;
  private addModel: addModel = addModel.instant;
  @State alarmItems: Array<formDataType> = new Array();
  showDelete: boolean = true;

  aboutToAppear() {
    this.initData();
  }
  initData(){
    let that = this;
    that.mainModel.queryAlarmsTasker((alarms: Array<formDataType>) => {
      that.alarmItems = alarms;
    })
  }
  build(){
    Column(){
      List({ space: 1, initialIndex: 0 }) {
        ForEach(this.alarmItems, (item:formDataType) => {
          ListItem() {
            Column(){
              Row(){
                Text(item.title)
                  .width('100%').fontSize(16)
                  .textAlign(TextAlign.Start)
              }
              Row(){
                Text(item.content)
                  .width('100%').fontSize(14)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Start)
                  .margin({top:10})
              }
              Row(){
                Text('提醒时间：'+ item.remindDay_text +' '+ item.remindTime_text )
                  .fontSize(14)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Start)
                if (this.showDelete) {
                  Image($r('app.media.ic_delele'))
                    .width(20)
                    .height(24)
                    .onClick(()=>{
                      CommonUtils.alertDialog({message:'你确定要删除该提醒吗？'},(dialog:{type:number})=>{
                        if(dialog.type==2){
                          this.addModel.removeAlarmRemind(item.id);
                          this.initData();
                        }
                      });
                    })
                }

              }.margin({top:10})
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              Row(){
                Text('提醒次数:'+item.snoozeTimes_text)
                  .fontSize(14)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Start)
                Text('提醒次数:'+item.snoozeTimes_text +"提醒时长："+item.ringDuration_text)
                  .fontSize(14)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Start)
                  .margin({left:10})
              }.margin({top:10})
              .width('100%')


            }
          }
          .backgroundColor('#ffffff')
          .borderWidth({bottom:1})
          .borderColor('#f7f7f7')
          .padding({bottom:15,top:15})
          .onClick(() => {
            router.pushUrl({ url: 'pages/AddNeedPage', params: { alarmItem: item } });
          })
        })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#ffffff')
    }.width('100%')
  }

}