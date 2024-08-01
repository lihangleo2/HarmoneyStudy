import { AbilityConstant, AbilityStage, Configuration, Want } from '@kit.AbilityKit';


//注意：这里创建好后，来到模块下的module.json5中，注册好对应的abilityStage：    "srcEntry": "./ets/myabilitystage/MyAbilityStage.ets",
export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    //：AbilityStage实例创建完成之后触发的回调函数
    console.log("MyAbilityStage ------ onCreate")
  }

  onAcceptWant(want: Want): string {
    //指定实例模式的UIAbility组件启动时触发的回调函数
    console.log("MyAbilityStage ------ onAcceptWant == "+want)
    return 'MyAbilityStageKey'
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    //系统发生全局配置变化的回调函数
    console.log("MyAbilityStage ------ onConfigurationUpdate")
  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    //系统决定调整内存时的回调函数
    console.log("MyAbilityStage ------ onMemoryLevel")
  }
}