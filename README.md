`flutter_debugframesize` is an library to support widget extension to debug frame sizes in app runtime.  It may be your pixel-perfect design UI debugging companion.

Pub link: https://pub.dev/packages/flutter_debugframesize

## Features

Show frame sizes for your specific widgets on screen.
![Screenshot_20230904_170028](https://github.com/VansonLeung/Flutter-DebugFrameSize/assets/1129695/91801e08-cc2d-4819-bbc7-912984406a34)

## Getting started

Add to pubspec.yaml: `flutter_debugframesize: ^1.0.0`


## Run this code before you render any widget to force disable it for production environment
```
// default
FlutterDebugFrameSizeConstants.isNeverEnabled = kReleaseMode;

// disable for all envs
FlutterDebugFrameSizeConstants.isNeverEnabled = true;

// enable for all envs
FlutterDebugFrameSizeConstants.isNeverEnabled = false;
```


## How to runtime toggle it
```
FlutterDebugFrameSizeConstants.isEnabled.value = !FlutterDebugFrameSizeConstants.isEnabled.value;
```



## Usage

Refer to `/example`

```
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child: const SizedBox(width: double.infinity, height: 20).debugFrameSize(),
),
```

```
Image.network(
  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')
  .debugFrameSize(
    debugFrameSizeBodyStyle: const DebugFrameSizeBodyStyle(
      color: Color(0xFF00cc00),
      fontSize: 20,
      thickness: 4,
      dashPattern: [10, 10],
    ),
  ),
```
