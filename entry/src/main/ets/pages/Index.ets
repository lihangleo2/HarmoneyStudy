import { it } from '@ohos/hypium';
import { CustomContentDialog } from '@ohos.arkui.advanced.Dialog';
import { webview } from '@kit.ArkWeb';
import { get, put } from '../utils/SPUtil';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { startAbility } from '../testutils/ActivityUtils';
import { TestAAPath, TestAbilityPath } from '../testutils/AbilityRouterPath';
import { router, Router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  //@State 就是DataBind的作用，改变数据源，ui跟着改变
  @State message: string | null = 'Hello Leo2';
  //申明变量
  @State count: number = 10;
  //申明常量
  readonly MAX_COUNT: number = 10
  //申明类
  @State user: User = new User(24, '小白')
  @State dogs: Array<string> = ['1', '2', '3', '4', '5']
  userArr: Array<User> = [new User(18, '小姐'), new User(26, '小哥')]
  //枚举
  favourColor: ColorLeo = ColorLeo.Red
  //联合类型，允许变量的值为多个类型.也就是允许类型切换
  luckNumber: number | string = 7
  // ?. 与 undefined的测试
  @State unUser: User | null = null
  //
  //list列表
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  //
  //Grid网格布局
  scroller: Scroller = new Scroller()
  //
  //Swiper
  @State swiperArr: number[] = [0, 1, 2, 3, 4]
  swiperController: SwiperController = new SwiperController();
  //web
  webviewController: webview.WebviewController = new webview.WebviewController();

  build() {
    // 申明变量
    // let count:number = 0;
    // 申明常量
    // const MAX_COUNT:number = 10;

    //基本类型：string  number boolean
    //引用类型：Object  Array  自定义类型
    //枚举类型：Enum
    //联合类型：Union --> 类似这种：User | null

    //类型别名：Aliases --> type定义的

    //打印还是用 console.log('我瞅瞅')
    //字符串拼接,有点类似kotlin，注意符号是``，不是'' ，console.log(`my name is ${this.message}`)

    RelativeContainer() {
      //  1.【简单的TextView】
      // Text(this.message)
      //   .id('HelloWorld')
      //   .fontSize(50)
      //   .fontWeight(FontWeight.Bold)
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })
      //   .backgroundColor('#ffffff')
      //   .onClick(() => {
      //     // this.testFor()
      //     // 点击时间额外逻辑
      //     if (this.message == 'Hello Leo2') {
      //       this.message = '点击后文案'
      //       //存值
      //       put("ceshi", 4)
      //       // console.log(`my name is ${this.message}`)
      //     } else {
      //       this.message = 'Hello Leo2'
      //       //取值
      //       get("ceshi", 2, (data) => {
      //         console.log(`我当前的值是多少呢 ==> ${data}`)
      //       })
      //       // this.message = null
      //       // this.test()
      //     }
      //   })
      //   .backgroundColor("#ff0000")
      //   .width('187.5lpx')


      // 2【普通Button按钮】；注意字符串拼接是``
      // Button(`测试按钮${this.count}`, { type: ButtonType.Normal, stateEffect: true })
      //   .id('button_normal')
      //   .borderRadius(8)
      //   .backgroundColor("#ff4063ef")
      //   .width(90)
      //   .height(30)
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })
      //   .onClick(() => {
      //     this.count++
      //     console.log(`buttonType Normal`)
      //   })


      // 3【胶囊Button】；注意字符串拼接是``
      // 胶囊按钮不增加radius
      // Button(`测试按钮${this.count}`, { type: ButtonType.Capsule, stateEffect: true })
      //   .id('button_capsule')
      //   .backgroundColor("#ff4063ef")
      //   .width(90)
      //   .height(30)
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })
      //   .onClick(() => {
      //     this.count++
      //     console.log(`buttonType Normal`)
      //   })


      // 4【圆形Button;】
      // Button({ type: ButtonType.Circle, stateEffect: true }) {
      //   LoadingProgress()
      //     .width(55)
      //     .height(55)
      //     .color("#ffffff")
      // }
      // // .id('button_capsule')
      // .backgroundColor("#ff4063ef")
      // .width(55)
      // .height(55)
      // .alignRules({
      //   center: { anchor: '__container__', align: VerticalAlign.Center },
      //   middle: { anchor: '__container__', align: HorizontalAlign.Center }
      // })
      // .onClick(() => {
      //   console.log(`buttonType Circle`)
      // })


      // 5【玩下Text控件】
      // Text($r('app.string.test_text_msg'))//'我是一段文本'
      //   .border({ width: 1, color: "#ff0000" })
      //     // 顾名思义就是设置baseline的
      //     // .baselineOffset(10)
      //     //设置个边padding
      //   .padding({
      //     top: 5,
      //     bottom: 5,
      //     left: 10,
      //     right: 10
      //   })
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })


      // 6【Image显示图片】
      // Image($r('app.media.app_icon'))
      //   .width(110)
      //   .height(110)
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })


      // 7【LinearLayout线性布局】
      //Column 容器：按照垂直放心排列 (下图展示了Colum的使用方式)
      //Row 容器：按照水平方向排列（同理）

      // Column({ space: 50 }) {
      //   Text()
      //     .width('90%')
      //     .height(50)
      //     .backgroundColor("#AFEEEE")
      //   Text()
      //     .width('90%')
      //     .height(50)
      //     .backgroundColor("#0FFFFF")
      //   Text()
      //     .width('90%')
      //     .height(50)
      //     .backgroundColor("#00FFFF")
      // }
      // .width('100%')
      // .backgroundColor("#ff0000")
      // .alignRules({
      //   center: { anchor: '__container__', align: VerticalAlign.Center },
      //   middle: { anchor: '__container__', align: HorizontalAlign.Center }
      // })


      // 8【List列表】
      // List({ space: 20, initialIndex: 0 }) {
      //   ForEach(this.arr, (item: number, index: number) => {
      //     ListItem() {
      //       Text(`我是列表item == ${index}`)
      //         .width('90%')
      //         .height(100)
      //         .backgroundColor("#ff7184fc")
      //         .textAlign(TextAlign.Center)
      //     }
      //   })
      // }
      // //这是控制List item里的排布
      // .alignListItem(ListItemAlign.Center)
      // //排列方向
      // .listDirection(Axis.Vertical)
      // //每行之间的分割线
      // .divider(
      //   {
      //     strokeWidth: 2,
      //     color: '#ff0000',
      //     startMargin: 0,
      //     endMargin: 0
      //   }
      // )


      // 9【网格布局】的使用
      // Grid(this.scroller){
      //     ForEach(this.arr, (item: number, index: number) => {
      //       GridItem() {
      //         Text(`我是列表item == ${index}`)
      //           .width('100%')
      //           .height(100)
      //           .backgroundColor("#ff7184fc")
      //           .textAlign(TextAlign.Center)
      //       }
      //     })
      // }
      // .padding(10)
      // .columnsTemplate('1fr 1fr 1fr')
      // .columnsGap(10)
      // .rowsGap(10)
      // .maxCount(10)//设置最大个数


      // 10【swiperController轮播组件】
      // Swiper(this.swiperController){
      //   ForEach(this.swiperArr,(item:number)=>{
      //     Text(`我是列表item == ${item}`)
      //       .width('100%')
      //       .height(100)
      //       .backgroundColor("#ff7184fc")
      //       .textAlign(TextAlign.Center)
      //   })
      // }
      // .autoPlay(true)
      // .loop(true)
      // .backgroundColor('#AFEEEE')


      // 11【WaterFlow瀑布流组件】
      WaterFlow() {
        ForEach(this.arr, (item: number) => {
          FlowItem() {
            Column() {
              if (item % 2 == 0) {
                Image($r('app.media.girl_long'))
              } else {
                Image($r('app.media.girl_short'))
              }
              Text(`瀑布流index=${item}`)
                .margin({ top: 5 })
            }
          }.onClick(() => {

            //这里是瀑布流的点击
            console.log(`我是被点击的哦 ==>${item}`)
            this.testGoActivity()
          })
        })
      }
      .padding(10)
      .columnsTemplate("1fr 1fr 1fr")
      .columnsGap(10)
      .rowsGap(10)


      // 12【web的使用】
      // 加载本地页面:  this.webviewController.loadUrl($rawfile("local.html"))
      // 加载html标签:  this.webviewController.loadData("<html><body>哈哈哈</body></html>","text/html","UTF-8")
      // Web({src:"https://www.baidu.com/",controller:this.webviewController})
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#ffffff')


    // 12 【除了上述所说组件，我们还有其他组件】
    // PatternLock() 手势密码锁
    // Slider() 类似android的progressBar
    // Tabs() 页签，有点类似android的tab+fragment
    // CustomContentDialog() 自定义弹窗组件
    // CalendarPicker() 日期选择器
    // TextPicker() 文字选择器
    // DatePicker() 日期选择器
    // TimePicker() 时间选择器
  }

  //显示Want启动
  testGoActivity() {
    router.pushUrl({url:TestAAPath})
    // startAbility(TestAbilityPath)
  }

  test() {
    /*
     * 1.空值判断方式一
     * */
    if (this.message == null) {

    }

    /*
     * 2.使用??
     * 如果左边得值为null的时候，则会显示右边的值
     * */
    // let testName = this.message??'左边的值为空时，显示右边的值'
    // console.log(`我就是这个值${testName}`)

    /*
     * 3.使用?
     * 如果左边的值为null的时候，则会显示undefined
     * */
    let testName = this.unUser?.name
    console.log(`我是小问号${testName}`)

  }

  testFor() {
    let students: string[] = ['小明', '小红', '小龙', '小白']
    //常规方式打印
    // for (let i = 0; i < students.length; i++) {
    //   console.log(`常规方式去打印${students[i]}`)
    // }

    //for of的方式打印
    // for (let element of students) {
    //   console.log(`forof语句方式去打印${element}`)
    // }

    //forEach 的方式打印
    students.forEach(student => {
      console.log(`forEach的方式打印${student}`)
    })

  }

  /*
   * 待研究
   * 闭包函数：一个函数可以将另一个函数当作返回值。保留内部作用域的访问。
   * */

  testInterface() {
    /*
     * 接口中需要注意的点：
     * 1.接口多了属性的概念，如果只拥有属性，那么可以用字面量的意思去new对象
     * 2.接口中如果加了方法的话，那么就无法通过字面量的意思去new对象了
     * */
    //鸿蒙接口多了属性的概念，通过字面量去new对象
    let genBao: AreaCat = { name: '根宝', age: 18 }
    console.log(`看看当前的小意思咯${genBao.name}}`)
  }
}

//定义一个类；如果要将此类给其他地方用，使用export
export class User {
  age: number
  name: string
  readonly HEAD_COUNT: number = 1

  constructor(age: number, name: string) {
    this.age = age
    this.name = name
  }

  //类里面注意，这些修饰符
  // public 在程序的任何可访问该类的地方都是可见的（默认）
  // * name: string
  // readonly 只读，不可修改
  // * readonly desc: string = '人类'
  // private 私有，只能在 Person 类里面访问
  // * private drink: string = '喝酒'
  // protected 保护，在Person和Student中，都可以访问，其他地方不能访问
  // * protected eat: string = '吃东西'
}

enum ColorLeo {
  Red,
  Blue,
  Green
}

//全属性接口，可以字面量去new对象
interface AreaCat {
  name: string,
  age: number
}

interface Person {
  age: number,
  name: string,

  work(): void;
}

class Teacher implements Person {
  age: number = 0;
  name: string = '小红呀';

  work(): void {
    console.log('老师在辛苦的教书')
  }
}

class AreaCatInfo implements AreaCat {
  name: string = "xiaoK";
  age: number = 10;
  fingler: number = 5
}




