import { Want } from '@kit.AbilityKit'

export const TestAbilityPath: Want = {
  deviceId: '', //指定拉起来的应用所在设备，deviceId为空表示本设备
  bundleName: 'com.leo.harmoneystudy', //指定拉起来的应用包名
  abilityName: 'TestAbility', //指定拉起来的Ability名
  moduleName: 'entry', //指定拉起来的Ability模块名
  parameters: {
    info: '我是一个传过来的信息，来自EntryAbility Index页面'
  }
}

export const TestAAPath: string = "testutils/TestIndex"