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

import { MineInfoList, InfoItem } from '../../model/Mine';

@Component
export struct ListInfo {

  build() {
    List() {
      ForEach(MineInfoList, (item: InfoItem) => {
        ListItem() {
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            Text(item.title).fontSize(16).height(40)

            Image($r('app.media.ic_more'))
              .objectFit(ImageFit.Contain)
              .height(24)
              .width(14)
          }
        }
        .backgroundColor('#ffffff')
        .margin({
          left: 24,
          right: 24
        })
        .height(48)
        .border({
          width: { bottom: 1 },
          color: '#f7f7f7'
        })

      }, (item: InfoItem) => JSON.stringify(item));
    }
    .border({
      radius: {
        topLeft: 24,
        topRight: 24
      }
    })
    .backgroundColor('#ffffff')
    .margin({ top: 10 })
    .padding({ top:16 })
    .flexGrow(1)
    .clip(true)
  }
}