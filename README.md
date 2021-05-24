#### 这是我的第一个flutter项目,我想通过项目实战来学习这一门技术,资料的地址(https://book.flutterchina.club/);
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
(https://flutterchina.club/setup-windows/)
- 下载安装flutter, android studio,
- 配置插件
- 在 android studio 和 vscode 分别使用flutter创建一个空项目
1. 
使用镜像:(添加用户环境变量,flutter官方为中国开启的临时镜像,写在电脑的:系统属性>高级>用户环境变量里面)
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

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

#### 4/30
> 继续按钮
> > 昨天　的　Theme　是个组件．．．理解上还有点问题
> > theme 将主题应用于字类
> >　1 描述排版, 颜色
> >　2 全局theme,MaterialApp 创建(可以局部使用)
> > ***问题:　如何实现表单域的滚动效果***
> > 没有解决这个问题
> 往下 form

#### 5/1 (劳动节)
- form
> > `expanded`, 类似于column,row,flex 用来展示多个组件集合的组件
> > ***问题: 不知道为什么按钮沾满了个剩余高度.***
> > 理解`使用 Builder`: 使用builder的目的是改变当前context.(初步理解)
- 进度指示器

#### 5/2
- 布局
> > flutter布局简介
> >　根据是否包含字节点把widget分成了三类(布局类组件都是有子组件的)
> >　LeafRenderObjectWidget,SingleChildRenderObjectWidget,MultiChildRenderObjectWidget
> > 1 布局类组件就是直接或间接包含MultiChildRenderObjectWidget的widget
> > 2 一般都有children用域接受widget
> > 3 继承关系: widget > RenderObjectWidget > (上面三类)
> > RenderObjectWidget 定义了创建更新 RenderObject的方法
- 线性布局: row 和 column

#### 5/3
- 接着说线性布局
> > row , column
> > ***问题: 使用column嵌套子级 时会默认沾满高度,但是我的没有,***
> > 如果column嵌套column ,并且想让子级column高度占满column使用Expanded组件
- 下面时弹性布局
> > flex , expanded
> > `因为Row和Column都继承自Flex`
> > `Spacer创建一个可调整的空间隔，可用于调整Flex容器（如行或列）中窗口小部件之间的间距。(包装好的expanded)`
> > 和示例有点差别

#### 5/4
- 流式布局(超出)
> > `Wrap`
> > 除了超出显示范围 Wrap会折行以外,其他行为基本相同
> > *runAlignment不知道效果*
> > `Flow`
> > 自定义布局和性能要求高的情况(性能好,灵活)
> > 比wrap复杂,必须指定父组件大小.

#### 5/5
- 层叠布局
> > `stack positioned`
> > 相当于position: relative和position: absolute
- 对齐,align
> > `FlutterLogo`
> > `Alingnment`
> > 1 布局时: Alingnment 会以矩形的中心点作为坐标原点,
> > 理解: 数值 和 静态常量得写法
> > > `Alignment(-1.0, -1.0)` = `Alignment.topLeft` 表示左顶点,
> > > `Alignment(1.0, -1.0)` = `Alignment.topRight` 表示右顶点
> > 2 坐标转换公式 布局
> > `(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)`
> > >　上面得 `childWidth　childHeight` 表示子元素宽高
> > > 上面两个式子算出来的时子元素实际偏移量(相对于左上角)
> > `FractionalOffset`
> > 这个和alignment一样都是用来定位的,区别在于: 他是用左上角来定位(和web一样)
> > 坐标转换公式: `(FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)`
- 对比(align和stack)
1. 定位参考体系不同
2. Stack可以有多个子元素
3. (相当于web里面的 text-align和position 的区别)
- `Center`组件
> > 继承了`Align` 对齐方式确定（Alignment.center）
> > `DecoratedBox`: 可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等

#### 5/6
- 容器类组件(竟然还挺快的)
> > `padding`
> > 尺寸限制类组件
> > > `ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio`

#### 5/7
- 容器组件
> > `SizeBox`
> > 多个父元素尺寸限制
> > `UnconstrainedBox`


#### 5/8
- 装饰组件
> > `DecoratedBox`
```
decoration: BoxDecoration(
  Color color, //颜色
  DecorationImage image,//图片
  BoxBorder border, //边框
  BorderRadiusGeometry borderRadius, //圆角
  List<BoxShadow> boxShadow, //阴影,可以指定多个
  Gradient gradient, //渐变
  BlendMode backgroundBlendMode, //背景混合模式
  BoxShape shape = BoxShape.rectangle, //形状
)
```
> > `LinearGradient` 用域定义线性渐变的类(还有其他定义渐变的类)
- 变换组件
> > `transForm`

#### 5/9
- `RotatendBox`
- `Container`
> > 本身不具备RendeObject,
> > 可以装饰变化限制
> > 因为: 他集合了很多其他组件功能: decoratedBox,constrainedBox,trnasform,padding,align
> > 设置宽高: constraints 或者 width/height, 后者优先
> > 设置背景: color 和 decoration,(只能设置一个)
- ***Flutter Gallery是Flutter官方提供的Flutter Demo，源码位于flutter源码中的examples目录下，笔者强烈建议用户将Flutter Gallery示例跑起来，它是一个很全面的Flutter示例应用，是非常好的参考Demo，也是笔者学习Flutter的第一手资料。***
> > `Could not find a command named "channer".
> > flutter多写一个t
> > > Setting "enable-windows-desktop" value to "true".
> > > 
> > > You may need to restart any open editors for them to read new settings.
***控制台报错: Unexpected child "deferred-components" found under "flutter".***

#### 5/10
- github user 1: Jun Shi Yan
- github user 1: 李泽鹏

```
@DhavalRKansara Your Flutter is on the stable channel. As mentioned previously, the gallery runs off the master channel, to which you can switch with

flutter channel master
flutter upgrade
```

#### 5/11
- gallery
> > 无法执行
> > 命令: `flutter channel`	列表或开关Flutter通道。
> > 命令: `flutter create .`	创建一个新的Flutter项目。
> > 命令: `flutter upgrade`	升级你的Flutter副本。
> 重新执行master 和 upgrade,执行`flutter upgrade` 自动执行一次`flutter doctor`,出现错误:  **Please install the "Desktop development with C++" workload, including all of its default components**
> 下面是根据博客上的文章执行的: 安装`visual studio` (它和vscode的区分查看: https://www.zhihu.com/question/384334551)
1. 打开网站下载
2. 打开安装包,点确认
3. 点击添加负荷
4. 选中:` "Desktop development with C++"`
5. 选中: `Windows 10 SDK (10.0.17763.0)`(Windows 10 SDK (10.0.17763.0) ，需要下载的是10.0.17763.0这个版本的)
6. 选择下载路径,点击安装
7. 执行flutter doctor
> > ***这个问题和昨天的问题有关联,具体内容查看(https://zhuanlan.zhihu.com/p/91686888)***


#### 5/12
- gallery
- 首先重新执行 `flutter doctor`
> 其他: 如何查看flutter 版本并切换1 `查看flutter --version` 2 `flutter versioin` 3 `flutter versioin vxxx`(版本号)
- 然后执行 `flutter channel stable`
- 然后执行 `flutter upgrade `
> 报错 ***unable to access 'https://github.com/flutter/flutter.git/'***
> 应该是网络问题导致的,重新来一次(如果不行就配置代理,这个回头在学)
- 然后`to run the app on Windows:`,执行: `flutter config --enable-windows-desktop`
- 然后执行`flutter create .`
> 报错: 还是`Unexpected child "deferred-components" found under "flutter"`(也就是说,我通过下载安装上面c++那个软件并没有用 或者 我使用错误)
> 没有解决, 忽略直接run(还是报错)
> 晚上看
> 答案就放在那,我解决不了问题(问)
> 问群里
```
如果你的电脑没有在开发者模式，使用插件会出错。 你可以在设置-->更新和安全-->开发者选项里设置

Building with plugins requires symlink support. Please enable Developer Mode in your system settings
```
- 重新 clone
- 失败
- 决定随缘,不写了

#### 5/13
- marterial 
> > 组件名称:	解释
> > AppBar:	一个导航栏骨架
> > MyDrawer:	抽屉菜单
> > BottomNavigationBar:	底部导航栏
> > FloatingActionButton:	漂浮按钮

(看react native 官网)
(
  1. 文档的交互示例,组件类型(函数和class),提示
  2. 核心组件和原生组件(该看这个了)
  3. 
)

#### 5/14
- `Tab`
```
Tab({
  Key key,
  this.text, // 菜单文本
  this.icon, // 菜单图标
  this.child, // 自定义组件样式
})
```
> > 使用任何图片都需要在yaml文件先引入

#### 5/15
- 解决了浮动按钮,嵌到底部的问题
- 裁剪
```
剪裁Widget	作用
  ClipOval  子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
  ClipRRect  将子组件剪裁为圆角矩形
  ClipRect  剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
```
> 'CustomClipper' 'clip'

#### 5/15
1. react 能干什么：
  用js访问移动平台的api
  实现外观和行为，通过react ui 组件
2. 基本概念
  a. 视图： react ui的最小组成部分， 相当于flutter的widget，或者html的标签
  b. 原生组件：react native 编写的应用和原生的一样，实质是对系统原生组件的封装（react native会把组件自动转换为系统的原生组件）（系统的原生组件：android的Kotlin或java编写视图，ios的swift或objective-c编写视图）。
  c. 核心组件：基础/常用的原生组件。
3. 和react一样的api
  react components > react native components > core/native/community(第三方组件)
  所以，接下来就是react的基础（组件，jsx，自定义组件，prop，state）
  另外：jsx中传递一个 JS 对象值的时候，就必须用到两层括号：{{width: 200, height: 200}}。
  另外：React.Fragment是抽象类，相当于小程序的block，写法`<> </>``<React.Fragment key={item.id}></React.Fragment>`
***暂停，使用检视阅读先读一次***
-检视阅读开始
1：跳过不过的 2：重点看主要的
a. 环境 ：译注：请注意！！！国内用户必须必须必须有稳定的代理软件，否则在下载、安装、配置过程中会不断遭遇链接超时或断开，无法进行开发工作。某些代理软件可能只提供浏览器的代理功能，或只针对特定网站代理等等，请自行研究配置或更换其他软件。总之如果报错中出现有网址，那么 99% 就是无法正常连接网络。
全部看标题看了一遍，感觉，把这个看完，了解了react native 开发之前的所有理论知识，除了配置环境的时候可以实际操作一下，大部分都是需要自己理解的。不过，看完知道了这是一个大的领域，蛋蛋android和ios就是两个完全不同的世界。目前看来，会比flutter更好开发一些，但是我看的官网，所以理解起来可能不像实战书那么熟。决定还是先看文档。


#### 5/18
- 可滚动组件
> > 默认超出会报错
> > 可滚动组件直接或间接包含一个scrollable组件
> > `scrollable`
> > > axisDirection属性:滚动方向
> > > physics属性:决定响应用户操作方式，接受scrollPhysics类型对象(包括ClampingScrollPhysics,和,bouncingScrollPhysics)
> > > controller: 控制位置和监听事件,接受ScrollController类型对象
> > `scrollbar`
> > > 给可滚动组件加滚动条
> > > 会在ios平台自动切换成`CupertinoScrollbar`(ios滚动条风格)
> > `sliver`
> > > 只构建出现在当前视口的子组件一种性能优化(视口: ViewProt,当前widget的实际显示区域)
> > > `SingleChildScrollView`不支持sliver
- `singleChildScrollView`

- react native: 入门组件
> `TextInput`
> > 注意 react 中的 onChange 对应的是 rn 中的 onChangeText
> > 具有“动态状态”的最简单的组件
> `ScrollView`
> > 所有组件都会被渲染,不进行sliver,不适合长列表
> > 再android和ios都有个子的区别
> `flatList`
> > 长列表: 立即渲染所有元素，而是优先渲染屏幕上可见的元素
> `secionList`
> > 长列表: 需要分组的数据

- react native: 针对不同平台的处理
> 方法一: `Platform`模块
**适用于平常代码中解决不同平台的少量代码冲突**
> > `Platform.OS`返回ios或这android
```
import { Platform, StyleSheet } from 'react-native';
const styles = StyleSheet.create({
  height: Platform.OS === 'ios' ? 200 : 100
});
```
> > `Platform.Select()`直接返回设定的value值
```
import { Platform, StyleSheet } from 'react-native'
const styles = StyleSheet.create({
  container: {
    flex: 1,
    ...Platform.select({
      ios: {
        backgroundColor: 'red'
      },
      android: {
        backgroundColor: 'blue
      }
    })
  }
})
```
*接受任何合法类型的参数,包括组件*
> > `Platform.Version`, 返回android和ios的当前版本
> > > 在 Android 上，Version属性是一个数字
> > > 在 iOS 上,返回当前系统版本的字符串,比如可能是"10.3"。

> 方法二: 特定平台扩展名
**适用于:不同平台代码放在不同的文件里时**
> > 目录下有俩文件
```
BigButton.ios.js
BigButton.andorid.js
```
> > 引入时会根据不同平台引入对应的后缀
```
import BigButton from './BigButton';
```
***明天就是环境搭建***

#### 5/19
***23:00***
在家没法运行flutter，
先把native看一遍（环境配置）
- 明确环境
1. 区分开发平台
2. 区分目标平台（在哪个平台使用）
**想从一个平台转移另一个平台，查看官方进行对应的环境搭建就好（部分区别）**

- 明确依赖
1. node，JDK，android studio
(android studio 是一个编译器，开发android应用的。开发时需要使用他提供的工具和环境)
（node版本大于12）
（JDK 是对java基础环境和相应开发平台标准和工具包的封装，安装版本必须是1.8,也称8版本）

***不能使用淘宝镜像（cnpm）***

（yarn是脸书替代npm的工具，可以加速node的下载，官方推荐使用yarn代替npm）

#### 5/20
- (工作上使用taro  又熟练了一波)
- 开始搭建rn环境
- 本机已经安装android studio,(然后跟着官网走)
- 以下是`Android 开发环境`
1. 安装 Android Studio(注意 安装 Android sdk, Android sdk platform, Android virtual device)
2. 安装 Android SDK (找官网,再配置中找到并且安装指定版本)
3. 配置 ANDROID_HOME 环境变量
4. 把一些工具目录添加到环境变量 Path
- 以下开始创建项目
1. `npx react-native init AwesomeTSProject --template react-native-template-typescript`使用ts模板创建rn项目
(如果没有安装 react-native 会先安装这个)
2. 接下来就是在 `react native` 的项目里面操作

#### 5/24
- 继续flutter组件学习
- `ListView`
- ListView 的 `默认构造函数`
> 指的是直接使用`ListView({children: list})`
> 通过这样的方式  list 中的所有widget都会提前全部渲染,(也就是不支持sliver)
- ListView 的 builder
> > > 滚动组件普遍规律: 构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持
- ListView 的 `separated`
> separated和builder的区别就是,多了个`separatorBuilder`,根据条件控制列表的每一项
***问题: 无法使用word_pair构造出组件,baseScroll4无法渲染***