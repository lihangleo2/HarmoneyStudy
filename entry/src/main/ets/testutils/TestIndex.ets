//这个是用来测试Ability的，注意Ability不是android中的Activity
@Entry
@Component
struct TestIndex {
  @StorageProp('info') info: string | null = null
  @State message: string = this.info ? this.info : 'Hello World';

  // @State message: string = 'Hello World';
  build() {
    RelativeContainer() {
      Text(this.message)
        .id('TestIndexHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}