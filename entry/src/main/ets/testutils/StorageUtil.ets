import { Want } from '@kit.AbilityKit';

export function setOrCreate(want: Want, key: string) {
  let object = want.parameters?.[key]
  console.log("我是传递过来的参数哦 ==> " + object)
  if (object) {
    AppStorage.setOrCreate(key, object)
  }
}