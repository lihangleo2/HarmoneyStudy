@Entry
@Component
struct Index {
  //@State 就是DataBind的作用，改变数据源，ui跟着改变
  @State message: string = 'Hello Leo2';
  //申明变量
  @State count: number = 10;
  //申明常量
  readonly MAX_COUNT:number = 10
  //申明类
  @State user:User = new User(24,'小白')

  @State dogs:Array<string> =['1','2','3','4','5']

  userArr:Array<User> = [new User(18,'小姐'),new User(26,'小哥')]

  //枚举
  favourColor:ColorLeo = ColorLeo.Red

  //联合类型，允许变量的值为多个类型.也就是允许类型切换
  luckNumber :number|string = 7

  build() {
    // 申明变量
    // let count:number = 0;
    // 申明常量
    // const MAX_COUNT:number = 10;

    //基本类型：string  number boolean
    //引用类型：Object  Array  自定义类型
    //枚举类型：Enum
    //联合类型：Union

    //类型别名：Aliases

    //打印还是用 console.log('我瞅瞅')
    //字符串拼接,有点类似kotlin，注意符号是``，不是'' ，console.log(`my name is ${this.message}`)

    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .backgroundColor('#ffffff')
        .onClick(() => {
          if (this.message == 'Hello Leo2') {
            this.message = '点击后文案'
            console.log(`my name is ${this.message}`)
          } else {
            this.message = 'Hello Leo2'
          }
        })
    }

    .height('100%')
    .width('100%')
    .backgroundColor('#ff0000')
  }
}

//定义一个类；如果要将此类给其他地方用，使用export
export class User {
  age: number
  name: string
  readonly HEAD_COUNT: number = 1
  constructor(age:number,name:string) {
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

enum ColorLeo{
  Red,
  Blue,
  Green
}
