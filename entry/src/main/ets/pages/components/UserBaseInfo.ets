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
import {ListInfo} from  "./ListInfo"
@Component
export struct UserBaseInfo {
  @State nickname: string = '无言的对话';
  @State signature: string = '测试专用';

  build() {
    Column() {
      // userIcon
     Column(){
       Image($r('app.media.ic_user'))
         .objectFit(ImageFit.Contain)
         .height(66)
         .width(66)
         .margin({ top: 71 })

       Column() {
         Text('LV.7')
           .fontSize(12)
           .fontWeight(FontWeight.Bolder)
           .fontColor('#c99411')
       }
       .width(44)
       .height(16)
       .margin({ top: '-8vp' })
       .border({ radius: 5})
       .backgroundColor('#d4e6f1')
       .justifyContent(FlexAlign.Center)

       // nickname
       Text(this.nickname)
         .fontSize(20)
         .margin({ bottom: 6 })
         .fontWeight(FontWeight.Normal)
         .fontColor('#000000')

       // signature
       Text(this.signature).fontSize(16).fontWeight(FontWeight.Normal)
         .fontColor('#66686a')
     }
     .backgroundImage($r('app.media.ic_dialog_smile'),ImageRepeat.NoRepeat)
     .backgroundImageSize({width:'100%'})
     .width('100%')
      .padding({bottom:15})
      Column(){
        ListInfo()
      }
    }.height('100%')
     .width('100%')
  }
}