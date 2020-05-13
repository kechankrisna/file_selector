#import "FileSelectorPlugin.h"
#if __has_include(<file_selector/file_selector-Swift.h>)
#import <file_selector/file_selector-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "file_selector-Swift.h"
#endif

@implementation FileSelectorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFileSelectorPlugin registerWithRegistrar:registrar];
}
@end
