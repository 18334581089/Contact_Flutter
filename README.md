#### 这是我的第一个flutter项目,我想通过项目实战来学习这一门技术,项目实战的地址(https://book.flutterchina.club/);
# flutter_app_vscode

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

#### 3/11
- 下载安装flutter, android studio,
- 配置插件
- 在 android studio 和 vscode 分别使用flutter创建一个空项目

#### 3/12
- 简单学习dart语言
> 声明变量
> 函数
> 异步
- 以上全部只是看了一遍

#### 3/13
- dart 官网 教程一个简单的dart程序

#### 3/14
- 小目标，先把dart的语法接着看一部份（生成一次commit）

#### 3/15
- (昨天没看,今天多看些!!!)
- 异步

#### 3/16
- 看书
- dart 和java 和 js
> JavaScript无疑是动态化支持最好的脚本语言
> Dart既能进行服务端脚本、APP开发、web开发
- 开始flutter计数器(创建flutter项目时默认的一个组件)
> 看动代码

#### 3/17
- 计数器(看懂代码)
> 简单理解
- 路由

#### 3/18
- 实现路由传参
> 目前还没完全看懂

#### 3/19
- yaml (的简单了解)

#### 3/20
- route完善
- 路由传值
> mainResolve 引入routerTestRoute widget,
> push 到 tipRoute (携带test参数)
> tip返回routerTestRoute 携带 参数 (如果点击tip的左上角返回按钮返回,则会返回null)
> 上面是非命名路由,
- 命名路由
> 路由表:注册路由(起名字)
> `Map<String, WidgetBuilder> routes`
> map数据
> key是string类型, 表示路由名称
> widgetBuilder是路由的回调函数
> 注册路由表
> MyApp类中添加routes属性
``` 
routes: {
  "new_page": (content) => NewRoute()
}
```
> 表示首页home 的路由
`"/": (context) => MyHomePage(title: 'flutter Demo Home Page')`
> 通过命名路由打开新页面
> 方法 Navigator.pushName
`Future pushNamed(BuildContext context, String routeName,{Object arguments})`
> 命名路由传参
> 通过settings对象注册参数
```
(context) {
  return TipRoute(text: ModalRoute.of(context).settings.arguments);
}
```
> 也可以通过settings对象获取参数(原本是)
`var args=ModalRoute.of(context).settings.arguments;`
> 路由钩子
> onGenerateRoute : 
> MaterailApp的属性 ,和routes同级
> 在routes中没有注册,但被navigator.pushNamed调用时会触发
> 

#### 3/22
- 接着包管理资料
> pub仓库实例  添加 english_words 包
> 把english_words  添加到依赖包管理列表
1. 修改yaml
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^0.1.0
  # 新添加的依赖
  english_words: ^3.1.3
```
2. 控制台: flutter packages get
> 如果在 android studio 编辑器,可以单继yaml右上角的package get,获取最新依赖
> 如果在 vs,yaml修改后自动更新
3. 页面引入
> `import 'package:english_words/english_words.dart';`
4. 页面中创建组件并使用
> ` new WordPair.random().toString()` 
> 返回一个随机字符串

#### 3/23
- 依赖本地包
```
dependencies:
	pkg1:
        path: ../../code/pkg1
```
- 依赖git(包位于Git存储库的根目录中)
```
dependencies:
  pkg1:
    git:
      url: git://github.com/xxx/pkg1.git
```
#### 3/24
- assets
> flutte 分为 code 和 assets 两部分
- 通过yaml配置flutter assets
```
flutter: 
  assets:
    - assets/my_icon.png
    - assets/background.png
```
- variant
> asset 变体
> flutter 的 assets 在构建过程中
> 会在相邻子目录中查找具有相同名称的任何文件
> 例入: 配置`assets/background.png`,构建时也会包含`assets/dark/background.png`

#### 3/27
- 目前看variant 貌似没什么用(将来有用)
- 加载 assets
> 主流两种方法加载assets(文字和图片)
> > 1 rootBundle 对象, 每一个flutter 都有一个rootBundle对象,可以获取主资源包.
`package:flutter/services.dart`
> > 当前方法会暴露一个rootBundle对象
> > 2 DefaultAssetsBundle 对象, 通过它获取AssetsBundle
> > 推荐第二种(好像是有响应关系的)
> 常见用法
> > 在组件运行上下文中使用 `DefaultAssetBundle.of()`间接加载assets
> > 在组件上下文之外使用rootBundle
> 加载图片
> > AssetImage 
> > 可以根据设备像素比例引入对应的图片尺寸
> > (满足上述条件: 目录配置倍数分辨率图片)
> > 1 
```
 new DecorationImage(
    image: new AssetImage('xxx.png'),
  ),
```
返回一个ImageProvider不是widget,所以用DecorationImage
> > 2 `Image.asset('xxx.png')`,返回的是一个图片widget
> 其他
> >　依赖包的资源　（给AssetImage配置package参数)
> > > 注意：包在使用本身的资源时也应该加上package参数来获取。
> 加载非flutter应用资源(上面的都是flutter启动后才能用)
> >　举例：　app图标,app启动图
> > 设置APP图标
> > > [Android开发人员指南](https://developer.android.com/guide/practices/ui_guidelines/icon_design_launcher.html#size)
- 调试(总算该看点能看懂的了)
> dart 分析器
> > `flutter analyze`, 一个静态代码检查工具, 测试你的代码, (intellij 会自动启用)
> > 不知道vs 现在这个插件有没有analyze检测
> dart Observatory 单步调试和分析器
> > 需要配置
> debugger() 声明
> > 使用上面的调试工具,代码里面写这个就可以插入断点,
> > 需要先引入`import 'dart: developer';`
> > 设置条件断点 `debugger(when: offset > 30.0);`
> 还有:  print, debugPrint, flutter logs, 调试动画,调试性能, 
> > debugPrint: 把当前组件状态转存dump(debugDumpApp: 转存widget树的状态)

> 异常捕捉
> > 捕捉之前先看dart的运行机制
![dart运行]](https://book.flutterchina.club/assets/img/2-12.eb7484c9.png)
> > > app执行 先执行microtask(微任务),在执行event (事件队列)
> > > (flutter 可以通过Future.microtask(…)向微任务中添加事件)
> > > 在事件循环中，当某个任务发生异常并没有被捕获时，程序并不会退出，而直接导致的结果是当前任务的后续代码就不会被执行了，也就是说一个任务中的异常是不会影响其它任务执行的。
> > flutter 框架捕捉错误方法
> > > try catch finally
> > > flutter 默认
```
catch (e, stack) {
  // 有异常时则弹出错误提示  
  built = ErrorWidget.builder(_debugReportException('building $this', e, stack));
}
```
> > > 自定义捕捉错误
```
FlutterError.onError = (FlutterErrorDetails details) {
  reportError(details);
};
```
> > flutter 框架不捕捉的错误处理(空对象异常,flutter执行异常)
> > > 同步
> > > 通过try
> > > 异步
> > > runZoned
> > > 理解: 类似沙箱, 影响降低
> > 下面是组件
#### 3/28
周日了，加了一个学flutter的新手，已经关注 名字叫 toknowmore

#### 3/29
- 组件
- widget
> 不是页面展示的组件, 是一个配置数据
> > 1 屏幕显示的是 类 `element`. widget树生成element树(广义:widget树 是 ui树)
> > 2 一个widget可以对应  个element
> widget 抽象类
> > 继承`DiagnosticableTree` 用来 提供调试信息
> > key,性能优化(是否复用组件,canUpdate方法用来判断)
> > createElement()
> statelessWidget 继承widget
> > widget的构造函数参数应使用命名参数，命名参数中的必要参数要添加@required标注，这样有利于静态代码分析器进行检查
> > context : build方法有一个context参数，它是BuildContext类的一个实例,表示当前widget在widget树中的上下文
> StatefulWidget 继承 widget
> > 重写了父类的createElement()方法
> > 添加新的方法,createState()
> statefullWidget对应一个state类
> > widget构建时可以同步获取
> > 在widget生命周期中可以改变,并调用setState() 通知框架重新执行build
> > 属性1widget:表示与该state绑定的widget,属性2context:同statelessWidget的context
> 写一个组件,研究state声明周期
> > `CounterWidget`

#### 3/31
- 复习state声明周期
- widget获取state对象
> 通过context获取
```
  // 查找父级最近的Scaffold对应的ScaffoldState对象
  ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
  //调用ScaffoldState的showSnackBar来弹出SnackBar
  _state.showSnackBar(
    SnackBar(
      content: Text("我是SnackBar"),
    ),
  );
```
> 通过of直接获取
```
// 直接通过of静态方法来获取ScaffoldState 
ScaffoldState _state=Scaffold.of(context); 
```
> 通过GlobalKey
```
//定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
static GlobalKey<ScaffoldState> _globalKey= GlobalKey();
```

#### 3/32
- 操作: 在widget中获取state
> 看不懂Builder
> 点击时,showSnackBar会弹出一个窗口显示文字
> 通过of
> > 提供of方法表示表示可以通过of获取(scaffold组件默认提供了of)
> > 没有提供of方法表示没有不可以返回父级state

- flutter 内置组件库
> Text, 带样式的文本 
> Row, Coulmn, 类似web中的flexbox布局
> Stack, 取代线性布局: 类似与web中的绝对定位盒子(配合Positioned)
> Container, 矩形视觉元素: 可以装饰一个BoxDecoration(如背景,边框,阴影),也可以设置margin,padding 

- widget组件库(Material和Cupertino)
> 1 内部都引入flutter/widgets.dart,所以使用这俩组件时,不需在引入
> 2 不同域web开发,不需要担心引入两个组件库,导致安装包变大,dart只会编译你使用了哪些代码

#### 4/2
- 同react和vue 的状态管理
> 1 如果是用户数据,由父组件管理 (选中状态,滑块位置)
> 2 如果是外观数据,由当前组件管理 (颜色,动画)
> 3 如果出现不同组件使用同一数据, 由他俩的父元素管理
- 简单组件 `TapboxAState`
> 自己管理自己状态的组件

#### 4/3
- 父管子组件 `ParentWidget`
> 组件名字都得是驼峰,首字母都得大写
- 父子分别管组件 `ParentWidgetC`
> flutter DouBan : 学习他的lib文件结构
> 创建文件夹划分模块(状态管理:`statusManagement`)
> > import 语法中的 `package: + 项目名称` 表示lib文件夹下
> > (项目名称在pubspec文件)
> 发现了:　dart语言中的`()`,可以写属性
> > `Container( child: new Text('...tip...'),)`
> > decoration,用来写样式的 , 赋值 用 new BoxDecoration

#### 4/4
- 先把状态组件放在一块

#### 4/5
> > 需要安装Android 4.1（API level 16）或更高版本的Android设备
> > 在您的设备上启用 开发人员选项 和 USB调试 。详细说明可在Android文档中找到。
> > 使用USB将手机插入电脑。如果您的设备出现提示，请授权您的计算机访问您的设备。
> > 在终端中，运行 flutter devices 命令以验证Flutter识别您连接的Android设备。
> > 运行启动您的应用程序 flutter run。

#### 4/6
- 看了一篇文，
- 原生的还是原生的，但是学起来是有难度的，
- flutter 相当于js的vue， 扩展，
- ---
- 我本来对它很有期待，
- 现在有一点怀疑了。
- ---
- 会用对我来说应该更加重要

#### 4/7
- 我为了准备面试，学了目前能学到的所有东西

#### 4/9 看文档
通过全局状态管理器, 处理相距较远的组件通信
1 全局事件总线, app组件的initState方法中订阅语言改变的事件
2 使用状态管理包, Provider,Redux

#### 4/14
由于基础的git操作失误,错失了这几天的commit日志,虽然,没改啥.
基础还是有点差劲

#### 4/16
ssi: 服务器端渲染,
可以选择reactssi框架,搭建项目

#### 4/18
一个作业帮的小哥，93年，4年前端，20k以上，年轻，帅气，又是一个比我厉害的人
理论：每天早上一小时，写flutter或者react 

#### 4/19
- 基础组件Text

#### 4/20
- 基础组件Text (2)
> TextSpan
- 文字算是看完了,最后的引入文字文件不是很理解,其他的应该问题不大

#### 4/24
- 基础组件 按钮
- 昨天的字体引入有问题: 导致无法运行程序
> 字体先不管,提交了一个issue继续写按钮的

#### 4/25
- 图片和icon
> ImageProvider 是一个抽象类,
> 就是定义了图片获取接口(load)
> image
> >　包括
> > AssetsImage: 定义从assets加载图片
> > NetworkImage: 定义从network加载图片
> > 使用image的属性
> > `SingleChildScrollView`,这玩意可以实现滚动
> > `EdgeInsets`,`SizedBox`,`BoxFit`, 这些widget相当于见过了
> 对 child 使用 .map 和 toList 也是见过了(就是把数组里面的每一个部件进行过滤和加工处理)
> > 类型判断`A is B`
> > 注意:
> > flutter 缓存图片数量最大1000,图片内存最大100m
> icon
> >　[查看所有的icons](https://material.io/tools/icons/)
> > 使用map的时候的问题(baseWidgetImg的49行注释)

#### 4/26
> icon
> > 使用meaterialIcons
> > `MainAxisAlignment`
> > 使用引入字体(ttf格式)
> > 无法引入字体文件并使用(原因是因为,修改了pubspec文件需要重新启动项目,而且控制台已经报错了)

#### 4/27
> 表单中switch和checkbox
> > Switch 和 Checkbox 都继承StatefulWidget,但是他们本身不会保存状态,父级来管理
> > `No Material widget found Switch widgets require a Material widget ancestor`使用switch需要再material的scaffold组件下使用
> 下一个,表单的控制焦点

#### 4/29
> 表单: 空值焦点
> > FocusNode 和 FocusScopeNode来控制焦点
> > `autofocus: true`, 一个页面中同时两个默认获取焦点,第一个获取到
> > `FocusNode.unfocus`: 失去焦点
> > `FocusScope.of(context)` 来获取Widget树中默认的FocusScopeNode
> 主题色: 按钮和输入框的默认颜色就是主题色中的hintColor
>