# flutter_package_s01

有用的Flutter S01 常用包

用于提供常用包的简单示例，能快速在自己的项目中使用起来。

## 1. webview

ANDROID IOS

网页加载显示的组件

### IOS端设置

`ios/Runner/Info.plist`

```xml
<key>io.flutter.embedded_views_preview</key>
<string>YES</string>
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

### 安卓加载网页失败

1. webview_flutter 无法加载

更换 webview_flutter_android

2. 握手失败

[解决方案](https://stackoverflow.com/questions/55592392/how-to-fix-neterr-cleartext-not-permitted-in-flutter)


## 2. provider

ANDROID IOS LINUX MACOS WEB WINDOWS

不同widget之间状态传递的组件

## 3. image_picker

ANDROID IOS WEB

选取图片的组件

### IOS配置

`ios/Runner/Info.plist`

```xml
<key>NSCameraUsageDescription</key>
<string>Used to demonstrate image picker plugin</string>
<key>NSMicrophoneUsageDescription</key>
<string>Used to capture audio for image picker plugin</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used to demonstrate image picker plugin</string>
```

## 4. local_notification

ANDROID IOS LINUX MACOS

本地通知push的组件

### IOS设置

`ios/Runner/Info.plist`

```xml
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
```

修改文件 `ios/Runner/AppDelegate.swift`的`didFinishLaunchingWithOptions`函数开头加上

```swift
if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
}
```

## 安卓设置

`android/app/src/main/AndroidManifest.xml`

```xml
<activity
    android:showWhenLocked="true"
    android:turnScreenOn="true"
>
```

## 5. sqflite

ANDROID IOS MACOS

sqlite数据库封装

## 6. video_player

ANDROID IOS WEB

播放视频的组件

## 7. qr_code

ANDROID IOS

扫描二维码的组件

## 8. colorpicker

ANDROID IOS LINUX MACOS WEB WINDOWS

拾取颜色的组件

## 9. awesome_dialog

ANDROID IOS LINUX MACOS WEB WINDOWS

各种神奇的对话框

## 10. file_picker

ANDROID IOS LINUX MACOS WEB WINDOWS

选择文件和目录的组件

### IOS设置

`ios/Runner/Info.plist`

```xml
<key>NSAppleMusicUsageDescription</key>
<string>Explain why your app uses music</string>
<key>UISupportsDocumentBrowser</key>
<true/>
<key>LSSupportsOpeningDocumentsInPlace</key>
<true/>
```

### 安卓设置

`android/app/src/main/AndroidManifest.xml` 的 `<application></application>`之间

```xml
<provider
android:name="androidx.core.content.FileProvider"
android:authorities="${applicationId}.provider"
android:exported="false"
android:grantUriPermissions="true">
<meta-data
    android:name="android.support.FILE_PROVIDER_PATHS"
    android:resource="@xml/provider_paths"/>
</provider>
```

## 11. flutter_share

ANDROID IOS

分享信息、链接、文件的组件

## 12. emoji_picker

ANDROID IOS MACOS

添加表情包的组件

## 13. flutter_statusbarcolor_ns

ANDROID IOS

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

