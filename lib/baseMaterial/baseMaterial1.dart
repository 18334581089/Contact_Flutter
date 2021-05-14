import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myDrawer.dart';

class BaseMaterial1 extends StatefulWidget {
  @override
  _Material createState() => _Material();
}

class _Material extends State<BaseMaterial1>
    with SingleTickerProviderStateMixin {
  // tabBar 底部菜单控制器
  TabController _tabController; //需要定义一个Controller
  List tabs = ['_tabController', "还可以通过拖动切换", "不仅可以通过点击tabBar切换", "抽屉可以从左侧划出"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  // 页面底部菜单选择标识
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          print(_tabController.index);
          break;
        case 1:
          print(_tabController.index);
          break;
        case 2:
          print(_tabController.index);
          break;
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('设置标题'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        // 设置左侧的按钮
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        // 生成Tab菜单
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: new MyDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.blue,
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 2,
            ),
          );
        }).toList(),
      ),
    );
  }
}
