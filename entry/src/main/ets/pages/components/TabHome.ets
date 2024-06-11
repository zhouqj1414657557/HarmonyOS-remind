
import { SwiperList,HomeTabsItem,MenuList,HomeMenuItem } from '../../viewmodel/HomeTabsModel';
import router from '@ohos.router';
import  {NeedList} from "./NeedList"

@Component
export struct HomeTabs {
  private swiperController: SwiperController = new SwiperController()
  private scroller: Scroller = new Scroller();
  @State currentBp: string = 'unknown'

  build() {
    Scroll(this.scroller) {
      Column() {
      // 轮播
      Swiper(this.swiperController) {
        ForEach(SwiperList, (item: HomeTabsItem) => {
          Image(item.img)
            .width('100%')
            .height(200)
            .objectFit(ImageFit.Cover)
            .borderRadius(15)
        })
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .onChange((index: number) => {
        console.info(index.toString())
      })
      // 菜单
      GridRow({
        columns: 4,
        breakpoints: { value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize },
        direction: GridRowDirection.Row
      }) {
        ForEach(MenuList, (item:HomeMenuItem) => {
          GridCol({ span: 1 }) {
            Column(){
              Image(item.img)
                .width(40)
                .height(40)
                .objectFit(ImageFit.Cover)
              Text(item.title)
                .fontSize('14vp')
                .margin({top:10})
            }.onClick(()=>{
              if(item.url){//页面跳转
                router.pushUrl({
                  url:item.url
                })
              }

            })
          }.padding({top:15})
        })
      }
      .width("100%")
      .height("100%")
      .backgroundColor('#ffffff')
      .padding({bottom:15})
      .borderRadius(10)
      .margin({top:5})
      // 最新待办
      Column(){
        // 标题
        Row(){
          Text('最新待办')
          Row(){
            Text('查看更多').fontSize('14vp')
            Image($r('app.media.ic_more'))
              .width(14)
              .height(14)
          }
          .onClick(()=>{
            console.log('----dai')
            router.pushUrl({
              url:'pages/NeedListPage'
            })
          })
        }
        .width('100%')
        .margin({top:5})
        .padding({top:15,left:15,right:15})
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor('#ffffff')

        // 列表
        NeedList({
          showDelete:false
        })


      }
      .margin({top:5})
    }
      .width('100%')
      .borderRadius(10)
     }
    .height('100%')
    .width('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .padding(5)

  }
}