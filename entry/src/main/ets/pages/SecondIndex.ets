import lottie from '@ohos/lottie'
import { AnimationItem, AnimationEventCallback } from '@ohos/lottie'

@Entry
@Component
struct SecondIndex {
  @State message: string = 'Good Leo2';
  private renderingSettings:RenderingContextSettings = new RenderingContextSettings(true)
  private renderContext:CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSettings)
  //
  private animateItem: AnimationItem | null = null;
  private animateName: string = "firstLottie";

  onPageShow(): void {
    console.log("--onPageShow")
  }

  onPageHide(): void {
    console.log("====onPageHide")
  }

  aboutToAppear(): void {
    //有点类似页面的onCreate,注意页面还没测量完
    console.log("++++++++aboutToAppear")
  }


  //页面销毁时释放动画资源
  aboutToDisappear(): void {
    console.log("aboutToDisappear")
    lottie.destroy()
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('SecondIndexHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .linearGradient({
          direction:GradientDirection.Bottom,
          colors: [["#ff08f31d",0.25],["#ff0c3be7",1]],
        })
        .onClick(()=>{
          lottie.destroy(this.animateName)
          this.animateItem = lottie.loadAnimation({
            container: this.renderContext,
            renderer: 'canvas', // canvas 渲染模式
            loop: true,
            autoplay: false,
            name: this.animateName,
            contentMode: 'Contain',
            path: "common/lottie/loading.json", // 路径加载动画只支持entry/src/main/ets 文件夹下的相对路径
          })
          lottie.play()
        })


      Canvas(this.renderContext)
        .width('250lpx')
        .height('250lpx')
        // .backgroundColor(Color.Gray)
        .alignRules({
          left:{anchor:'__container__',align:HorizontalAlign.Start},
          right:{anchor:'__container__',align:HorizontalAlign.End},
          bottom:{anchor:'SecondIndexHelloWorld',align:VerticalAlign.Top},
        })
        .margin({bottom:'20lpx'})
        // .backgroundImage($r('app.media.startIcon'))

    }
    .height('100%')
    .width('100%')
  }
}