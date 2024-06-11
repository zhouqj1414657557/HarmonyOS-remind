
import {HomeTabs} from  "./components/TabHome"
import {UserBaseInfo} from  "./components/UserBaseInfo"


@Entry
@Component
struct MinePage {
  @State currentIndex: number = 0

  // 构造类 自定义底部切换按钮
  @Builder TabBuilder(index: number,icon:Resource,selectedIcon:Resource,name:string) {
    Column() {
      Image(this.currentIndex === index ? selectedIcon : icon)
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(`${name}`)
        .fontColor(this.currentIndex === index ? '#007DFF' : '#000000')
        .fontSize('14vp')
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%').height('100%')
    .backgroundColor('#ffffff')
  }
  build() {

    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          HomeTabs(); //首页
        }.tabBar(this.TabBuilder(0,$r('app.media.ic_home'),$r('app.media.ic_home_selected'),'首页'))

        TabContent() {
          UserBaseInfo()//个人中心
        }.tabBar(this.TabBuilder(1,$r('app.media.ic_mine'),$r('app.media.ic_mine_selected'),'我的'))
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
      .width('100%')
    }
    .width('100%')
    .height('100%')

    .backgroundColor('#f7f7f7')
  }
}