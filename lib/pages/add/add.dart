import 'package:buhuiwangshi/pages/add/area/reminder_level_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buhuiwangshi/pages/add/area/name_area.dart';
import 'package:buhuiwangshi/pages/add/area/time_area.dart';
import 'package:buhuiwangshi/pages/add/area/template_area.dart';
import 'package:buhuiwangshi/pages/add/area/type_area.dart';

import 'package:buhuiwangshi/utils/colors.dart';
import 'package:buhuiwangshi/utils/standard.dart';
import 'package:buhuiwangshi/pages/add/store.dart';

// 添加页
class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return standardContainer(
      context: context,
      child: Scaffold(
        appBar: TopAppBar(),
        body: Body(),
      ),
    );
  }
}

/// 以下是头部部分
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // 左侧按钮
    var iconButton = IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_circle_left_outlined,
        color: textColor(context),
      ),
    );
    // 中间标题
    var text = Text(
      "添加日程",
      style: TextStyle(fontSize: 24, color: textColor(context)),
    );
    // w右侧保存
    var textButton = TextButton(
        onPressed: () {},
        child: Text("保存",
            style: TextStyle(fontSize: 18, color: textColor(context))));

    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 64,
      leading: iconButton,
      centerTitle: true,
      title: text,
      actions: [textButton],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64);
}

/// 以下是内容部分
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 各个区域
    var column = Column(
      children: [
        TemplateArea(),
        NameArea(),
        TimeArea(),
        TypeArea(),
        ReminderLevelArea()
      ],
    );

    return ChangeNotifierProvider(
      child: Container(
        color: Colors.white,
        child: column,
      ),
      create: (context) => FormStore(),
    );
  }
}
