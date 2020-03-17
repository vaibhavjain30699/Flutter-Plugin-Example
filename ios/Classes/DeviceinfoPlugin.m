#import "DeviceinfoPlugin.h"
#if __has_include(<deviceinfo/deviceinfo-Swift.h>)
#import <deviceinfo/deviceinfo-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deviceinfo-Swift.h"
#endif

@implementation DeviceinfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceinfoPlugin registerWithRegistrar:registrar];
}
@end
