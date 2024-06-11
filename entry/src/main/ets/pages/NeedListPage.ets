import router from '@ohos.router';
import  {formDataType} from  '../viewmodel/AddNeedModel'
import NeedModel from '../viewmodel/NeedListModel';
import  {NeedList} from "./components/NeedList"


@Entry
@Component
struct NeedListPage {
  private mainModel: NeedModel = NeedModel.instant;

  @State alarmItems: Array<formDataType> = new Array();
  aboutToAppear() {
    this.initData();
  }
  initData(){
    let that = this;
    that.mainModel.queryAlarmsTasker((alarms: Array<formDataType>) => {
      that.alarmItems = alarms;
    })
  }

  build() {
    // 列表
    Column() {
      NeedList({showDelete:true})
      // 新增按钮
      Button() {
        Image($r('app.media.ic_add')).objectFit(ImageFit.Fill)
      }
      .backgroundColor('#00000000')
      .width(48)
      .position({
        x:'80%',
        y:'90%'
      })
      .height(48)

      .onClick(() => {
        router.pushUrl({ url: 'pages/AddNeedPage' });
      })
    }
    .width('100%')
    .height('100%')
  }


}