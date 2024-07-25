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
          // this.testFor()
          // 点击时间额外逻辑
          if (this.message == 'Hello Leo2') {
            this.message = '点击后文案'
            console.log(`my name is ${this.message}`)
          } else {
            this.message = 'Hello Leo2'
            this.message = null
            this.test()
          }
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#ff0000')
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

interface Person{
  age:number,
  name:string,

  work():void;
}

class Teacher implements Person{
  age: number=0;
  name: string='小红呀';

  work(): void {
    console.log('老师在辛苦的教书')
  }

}




