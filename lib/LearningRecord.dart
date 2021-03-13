// 一 生命变量

// 使用var
import 'dart:html';

var t = "hi world";
// t = 1000; // 强语言类型,无法修改

// 使用dynamic / Object
dynamic t2 = "hi world";
Object x = "Hello Object";

// 一个简单的dart教程
printInteger(int aNumber) {
  // 解释 $variableName 表示字符串插槽,包括字符串文字内部的标量和表达式的字符串
  print('The number is $aNumber.');
}

main() {
  // main() 程序开始执行的函数,该函数是特定的必须的顶级函数
  var number = 42;
  printInteger(number);

  // 进一步理解
  // dynamic 和 object 都表示任意类型,但是(object 只能访问它拥有的属性方法)

  // 官方教程开搞

  // 首先声明变量的时候,(类型推断) 会根据初始值推断当前数据类型的具体类型
  // 默认是null,不管前面是int还是其他
  int intnum;
  assert(intnum == null); // 生产环境会忽视assert方法

  // 常量
  final finalVar1 = 'he world';
  final String finalVar2 = 'he world2';
  // final 声明的变量不能修改
  const bar = 10000;
  // const
  // 可以生命一个编译时固定得值
  const double atm = 1.01325 * bar;
  // 创建常量值 //  任何变量都可以拥有常量值。
  var constVal1 = const [];

  // ==
  // == 运算符用来测试两个对象是否相等

  // 字符串
  var str = '插值表达${123}, 也可以$double';
  var str0 = '''三个单引号,
  双引号可以实现多行字符串对象的创建''';
  var str1 = r"in a raw string, even \n isnit special"; // 原始raw,保持格式

  // boolean
  // 不能和js一样隐式转换
  var fullName = '';
  assert(fullName.isEmpty);
  var hitPoints = 0;
  assert(hitPoints <= 0);
  assert(hitPoints.isNaN);
  // bool声明
  bool bool1 = true;

  // list
  var list = [1, 2, 3];
  // list[0] = '';// 报错,推断为List<int>无法添加字符串类型
  var list2 = const [1, 2, 3, 4];
  list2[1] = 1; // 官网说会报错但是没有

  // set
  Set<String> set1 = {};
  // 添加元素
  set1.add('prop1');
  var set2 = {'fluorine', 'chlorine', 'bromine'};
  set1.addAll(set2);
  // set常量
  final constantSet = const {'str1', 'str2'};
  constantSet.add('addProp'); // 官方说报错

  // map
  var map = {}; // 注意这是一个map
  var gifts = {'first': 'partridge'};
  // 访问length
  gifts.length == 2;

  // -----------------------------------
  // 函数
  bool isNoble(int atomicNumber) {
    return gifts[atomicNumber] != null;
  }

  // 简写 箭头 语法
  bool isNoble2(int atomicNumber) => gifts[atomicNumber] != null;
  // 默认返回null
  foo() {}
  print(foo());
  // 一等公民(作为参数传递)
  void returnVoid(Object element) {
    print(element);
  }

  list.forEach(returnVoid);
  // 函数赋值
  var var3 = isNoble;
  // 匿名函数
  var var4 = (msg) => 'str is $msg';

  // 类型判断运算符 is as
  dynamic emp = {};
  if (emp is Person) {
    emp.firstName = 'Bob';
  }
  // 上面的代码等同于
  (emp as Person).firstName = 'Bob';

  // 级联
  // 概念: 对 同一对象 进行操作
  // example:
  querySelector('#confirm')
    ..text = 'Confirm'
    ..classes.add('important')
    ..onClick.listen((e) => print('Confirmed!'));
  // 等同于
  var button = querySelector('#confirm');
  button.text = 'Confirm';
  button.classes.add('important');
  button.onClick.listen((e) => print('ok'));
  // 特点 可以嵌套(像表达式一样可以写括号里)
  // “两个点” 的级联语法不是一个运算符。 它只是一个 Dart 的特殊语法。

  // 判断语句
  if (true) {} // 必须是布尔类型
}

// 网上class使用
class Person {
  String firstName;
}
