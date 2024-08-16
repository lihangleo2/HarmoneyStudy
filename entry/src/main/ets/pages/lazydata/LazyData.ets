// Basic implementation of IDataSource to handle data listener
class BasicDataSource<T> implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: T[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): T {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

//初始化数据
//private listDatas: SmartDataSource<string> = new SmartDataSource();
//添加单个数据 / 添加数组数据 addData()支持"单个数据"和"数组"
//this.listDatas.addData("数据")
//从某个index插入数据，同理支持"数组"
//this.listDatas.addData("数据",index)

//更新某个数据数据 index
//this.listDatas.updateData("数据",index)
//删除某个数据 index
//this.listDatas.deleteData(index)

//修改数据源datas
//this.listDatas.modifyData(datas)

export class SmartDataSource<T> extends BasicDataSource<T> {
  private dataArray: T[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): T {
    return this.dataArray[index];
  }

  public updateData(data: T,index: number): void {
    this.dataArray[index] = data
    this.notifyDataChange(index)
    // this.deleteData(index)
    // this.addData(data,index)
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }


  public addData(data: T | T[], index?: number): void {
    if (data instanceof Array) {
      if (index == undefined) {
        this.dataArray = this.dataArray.concat(data)
        this.notifyDataAdd(this.dataArray.length - 1);
      } else {
        data.reverse().forEach((item) => {
          this.dataArray.splice(index, 0, item);
          this.notifyDataAdd(index);
        })
      }
    } else {
      if (index == undefined) {
        this.dataArray.push(data);
        this.notifyDataAdd(this.dataArray.length - 1);
      } else {
        this.dataArray.splice(index, 0, data);
        this.notifyDataAdd(index);
      }
    }
  }


  public modifyData(data: T[]) {
    const promise: Promise<void> = new Promise((resolve: Function) => {
      this.dataArray = []
      this.notifyDataReload()
      setTimeout(() => {
        this.dataArray = this.dataArray.concat(data)
        this.notifyDataAdd(this.dataArray.length - 1);
      }, 1)
    })
  }

  // public clearDatasSync(): Promise<void> {
  //   const promise: Promise<void> = new Promise((resolve: Function) => {
  //     this.dataArray = []
  //     this.notifyDataReload()
  //     setTimeout(() => {
  //       resolve()
  //     }, 1)
  //   })
  //   return promise
  // }
  //
  // public clearDatas(): void {
  //   this.dataArray = []
  //   this.notifyDataReload()
  // }
}