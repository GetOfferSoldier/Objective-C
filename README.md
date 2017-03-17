# iOS-Soldier
2017 iOS知识点汇总，如有纰漏还望指点，感激不尽。

## How to contribute
1. 如果你非常乐意分享,如果你非常愿意加入讨论,可以加入我们的QQ群。
2. 如果你看到我们的内容有错误,或者不完善的地方,你可以提 pull request.
3. 如果你想在这个仓库里面加入自己的问题,我们会及时加入。
4. 为了保证很方便的追述每个问题,了解我们对每个问题的理解由浅入深。需要修改某个问题的答案的时候请按照指定的格式。


**Q:1+1 =?**

答:

我是第二次修改后的答案

    2017年4月20日第二次修改
    修改原因: balabal
    
~~我是第一次修改之后的答案~~

    2017年2月21日第一次修改
    修改原因: balabala
    
~~我是原始答案~~

---

[2017-03-18-01](https://github.com/GetOfferSoldier/Objective-C/blob/master/2017/03/2017-03-18-01.md)

1. OC 中,与 alloc 语义相反的方法是 dealloc 还是 release？ 与 retain 语义相反的方法是 dealloc 还是 release？ 为什么？ 需要与 alloc 配对使用的方法是 dealloc 还是 release, 为什么?

2. 这段代码有什么问题吗？

    ```obj-c
    - (void)setAge:(int)newAge {
        self.age = newAge;
    }
    ```
3. 这段代码有什么问题, 如何修改?

    ```obj-c
    for (int i = 0; i < someLargeNumber; i ++) {
        NSString *string = @"Abc";
        string = [string lowercaseString];
        string = [string stringByAppendingString:@"xyz"];
        NSLog(@"%@", string);
    }
    ```
4. objective-c 所有对象间的交互是如何实现的？
5. `#import` 和 `#include` 有什么区别？ `@class` 呢？
6. 分别写一个 setter 方法用于完成
`@property(nonatomic, strong)NSString *name`
`@property(nonatomic, copy)NSString *name`
7.  对于语句 `NSString *obj = [[NSData alloc] init];` obj 在编译时和运行时分别是什么类型的对象？
8. 常见的 OC 数据类型有哪些？ 和 C 的基本数据类型有什么区别？如： NSInteger 和 Int 有什么区别？
9. OC 如何对内存管理的，说说你的看法和解决方法？
10. 你对 @interface 中的成员变量和 @property 声明的属性的理解？
11. 浅拷贝和深拷贝的区别？
12. 什么时候用 delegate， 什么时候用 Notification?
13. 描述一下 iOS SDK 中如何实现 MVC 的开发模式？
14. ViewController 的生命周期？
15. iOS中有哪些多线程方案？


[2017-02-24-01](https://github.com/GetOfferSoldier/Objective-C/tree/master/2017/02/2017-02-24-01/CollectionViewFlowLayout)

1. 一个用 UICollectionView 自定义圆环 + CABasicAnimation 组合无限旋转/等比缩放的动画(充数用的，请先看 ReadMe.md 😂)

[2017-02-22-01](https://github.com/GetOfferSoldier/Objective-C/blob/master/2017/02/2017-02-22-01.md)


1. `id` 和 `instancetype` 的区别?
2. 有方法查看当前系统内存使用的情况吗？
3. 为什么 NotificationCenter 要 removeObserver? 如何实现自动 remove？
4. iOS的沙盒目录结构是怎样的？ App Bundle 里面都有什么？
5. 简单描述一下客户端的缓存机制？


[2017-02-21-01](https://github.com/GetOfferSoldier/Objective-C/blob/master/2017/02/2017-02-21-01.md)

1. 写出中序遍历二叉树的算法(不限编程语言，已知 TreeRoot 为二叉树的根)
2. 快速排序，归并排序的时间复杂度分别是什么？
3. UITableViewCell 可重用机制是什么?有什么要注意的地方?
4. OC 中的 @property 和 @synthesize 有什么用？
5. OC有没有重载(overload)和重写(overwrite)？有的话请举个例子。
6. 列举出 iOS 开发中三种最常出现的循环引用的场景。
7. MVC 模式具体指什么？iOS现在流行的 MVVM 是什么？
8. iOS 中设计金钱计算和比较时，用数值应该用哪个类型来处理？
9. iOS 上触摸事件的视图检测和事件传递过程是怎样的？  
10. 写一个折半查找或者快速排序


[2017-02-20-01](https://github.com/GetOfferSoldier/Objective-C/blob/master/2017/02/2017-02-20-01.md)

1. 对内存管理的理解。
2. 类别的作用
3. 点击屏幕上的按钮，系统做了什么？

[2017-02-19-01](https://github.com/GetOfferSoldier/Objective-C/blob/master/2017/02/2017-02-19-01.md)

1. 按钮或者 View 在进行 frame 动画的时候，为什么点击 frame 动画的重点位置才能触发事件？如何在动画过程中响应事件？


