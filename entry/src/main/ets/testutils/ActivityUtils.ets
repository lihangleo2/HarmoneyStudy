import { common, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'

export function startAbility(want: Want,component?: Object) {
  let context: common.UIAbilityContext = getContext(component) as common.UIAbilityContext
  context.startAbility(want).then(() => {
    //启动成功
    console.log("启动成功----")
  }).catch((err: BusinessError) => {
    //启动失败
    console.log('启动失败====' + err.name + "====" + err.message)
  })
}