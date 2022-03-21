/// 使用awesome_dialog实现各种神奇的对话框案例
/// 可以在移动端和桌面端全平台使用

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogPage extends StatefulWidget {
  const AwesomeDialogPage({Key? key}) : super(key: key);

  @override
  State<AwesomeDialogPage> createState() => _AwesomeDialogPageState();
}

class _AwesomeDialogPageState extends State<AwesomeDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("awesome_dialog"),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedButton(
                text: '固定宽度、方形按钮的通知对话框',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO_REVERSED,
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    width: 280,
                    buttonsBorderRadius:
                        const BorderRadius.all(Radius.circular(2)),
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: '通知',
                    desc: '关于对话框的信息描述',
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                    btnOkText: "确定",
                    btnCancelText: "取消",
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '定制按钮样式的问题对话框',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: '问题',
                    desc: '问题的描述...',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '没有按钮的通知对话框',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: true,
                    animType: AnimType.BOTTOMSLIDE,
                    title: '通知',
                    desc: '通知：关于xxx问题的修复正在进行中，请耐心等待',
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '警告对话框',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          headerAnimationLoop: false,
                          animType: AnimType.TOPSLIDE,
                          showCloseIcon: true,
                          closeIcon:
                              const Icon(Icons.close_fullscreen_outlined),
                          title: '警告',
                          desc: '警告信息的描述...',
                          btnCancelOnPress: () {},
                          onDissmissCallback: (type) {
                            debugPrint('Dialog Dissmiss from callback $type');
                          },
                          btnOkOnPress: () {})
                      .show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '错误对话框',
                color: Colors.red,
                pressEvent: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.RIGHSLIDE,
                          headerAnimationLoop: true,
                          title: '错误',
                          desc: '错误信息描述...',
                          btnOkOnPress: () {},
                          btnOkIcon: Icons.cancel,
                          btnOkColor: Colors.red)
                      .show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '成功对话框',
                color: Colors.green,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      animType: AnimType.LEFTSLIDE,
                      headerAnimationLoop: false,
                      dialogType: DialogType.SUCCES,
                      showCloseIcon: true,
                      title: '成功',
                      desc: '操作成功的信息描述...',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDissmissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
                      }).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '无头部对话框',
                color: Colors.cyan,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: false,
                    dialogType: DialogType.NO_HEADER,
                    title: '无头部',
                    desc: '信息描述...',
                    btnOkOnPress: () {
                      debugPrint('OnClcik');
                    },
                    btnOkIcon: Icons.check_circle,
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '内容定制对话框',
                color: Colors.blueGrey,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    body: const Center(
                      child: Text(
                        '如果指定了body，则标题和描述都会被忽略，也就可以自由定制对话框的内容了',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    title: '被忽略',
                    desc: '这是被忽略的',
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '自动隐藏对话框',
                color: Colors.purple,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.SCALE,
                    title: '自动隐藏',
                    desc: '2秒钟后自动隐藏',
                    autoHide: const Duration(seconds: 2),
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '测试对话框',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    keyboardAware: true,
                    dismissOnBackKeyPress: false,
                    dialogType: DialogType.WARNING,
                    animType: AnimType.BOTTOMSLIDE,
                    btnCancelText: "取消",
                    btnOkText: "确定",
                    title: '是否继续?',
                    // padding: const EdgeInsets.all(5.0),
                    desc: '告知信息的描述...',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: '带输入框的对话框',
                color: Colors.blueGrey,
                pressEvent: () {
                  late AwesomeDialog dialog;
                  dialog = AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    keyboardAware: true,
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '表单数据',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 0,
                            color: Colors.blueGrey.withAlpha(40),
                            child: TextFormField(
                              autofocus: true,
                              minLines: 1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: '标题',
                                prefixIcon: Icon(Icons.text_fields),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 0,
                            color: Colors.blueGrey.withAlpha(40),
                            child: TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.multiline,
                              maxLengthEnforced: true,
                              minLines: 2,
                              maxLines: null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: '描述',
                                prefixIcon: Icon(Icons.text_fields),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedButton(
                              isFixedHeight: false,
                              text: '关闭',
                              pressEvent: () {
                                dialog.dismiss();
                              })
                        ],
                      ),
                    ),
                  )..show();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
