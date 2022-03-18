# flutter_package_s01

有用的Flutter S01 常用包

用于提供常用包的简单示例，能快速在自己的项目中使用起来。

## 1. webview

网页加载显示的组件

安卓情况下，加载网页失败

1. webview_flutter 无法加载

更换 webview_flutter_android


2. ssl失败

https://stackoverflow.com/questions/55592392/how-to-fix-neterr-cleartext-not-permitted-in-flutter


## 2. provider

不同widget之间状态传递的组件

## 3. image_picker

选取图片的组件

## 4. local_notification

本地通知push的组件

## 5. sqflite

sqlite数据库封装

## 6. video_player

播放视频的组件

## 7. qr_code

扫描二维码的组件

## 8. colorpicker

拾取颜色的组件

## 9. awesome_dialog

各种神奇的对话框

## 10. file_picker

选择文件和目录的组件

## 11. flutter_share

分享信息、链接、文件的组件

## 12. emoji_picker

添加表情包的组件

## 13. flutter_statusbarcolor_ns

修改状态栏颜色的组件


## 解决问题

1. 安卓emulator报错x86CPU的问题

增加环境变量，顺序必须一致

```shell
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=${ANDROID_SDK}/emulator:${ANDROID_SDK}/tools:$PATH
```

2. 安卓模拟器不能联网

**临时解决方案**: 从命令行启动

```shell
emulator @Pixel_5_API_29 -dns-server 8.8.8.8,114.114.114.114
```

**永久解决方案**: 修改mac上的dns，增加两个dns服务器 8.8.8.8 和 114.114.114.114

