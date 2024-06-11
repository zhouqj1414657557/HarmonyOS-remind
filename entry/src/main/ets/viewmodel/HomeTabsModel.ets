

export  interface  HomeTabsItem{
  img:Resource;
}
export  interface  HomeMenuItem{
  img:Resource;
  title?:string;
  url?:string
}
export const SwiperList: Array<HomeTabsItem> = [
  {
    img: $r('app.media.ic_swiper_1'),
  },
  {
    img: $r('app.media.ic_swiper_2'),
  },
  {
    img: $r('app.media.ic_swiper_3'),
  }
]

export const MenuList: Array<HomeMenuItem> = [
  {
    img: $r('app.media.ic_menu_1'),
    title:"宝宝日常"
  },
  {
    img: $r('app.media.ic_menu_2'),
    title:"待办提醒",
    url:"pages/NeedListPage"
  },
  {
    img: $r('app.media.ic_menu_3'),
    title:"纪念日"
  },
  {
    img: $r('app.media.ic_menu_4'),
    title:"注意事项"
  }
]

