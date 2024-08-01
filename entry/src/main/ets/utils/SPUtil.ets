import { preferences, ValueType } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'

//get(查询)
//put(插入)
//has(检查是否存在)
//delete(删除)
//flush(写入文件)
//
//如果需要在下次进入应用之后设置依然生效 --> onPageShow方法处调用即可
const SP_NAME = "defaultSP"
const KEY_IS_FIRST = "isFirst"

//===================  支持传自定义spName表名  ======================
//注意实现重载的方式使用：spName?:string
//传spName:则为自定义表明
//不传，则默认为SP_NAME

export function get(key: string, defaultValue: preferences.ValueType,callback:SpGetCallback,spName?:string) {
  preferences.getPreferences(getContext(), spName?spName:SP_NAME).then(async (preferences: preferences.Preferences) => {
    callback(preferences.getSync(key,defaultValue))
  })
}

export function put(key: string, value: preferences.ValueType,spName?:string) {
  preferences.getPreferences(getContext(), spName?spName:SP_NAME).then(async (preferences: preferences.Preferences) => {
    await preferences.put(key, value)
    preferences.flush()
  })
}

export type SpGetCallback = (value: preferences.ValueType) => void;



