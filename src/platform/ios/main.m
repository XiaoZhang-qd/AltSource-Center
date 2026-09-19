#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <Foundation/Foundation.h>
#include "../../core/urlscheme.h"
extern const char *asc_core_version(void);

@interface ASCBridge : NSObject <WKScriptMessageHandler>
@property(nonatomic,weak) WKWebView *webView;
@end

@implementation ASCBridge
- (void)userContentController:(WKUserContentController *)controller didReceiveScriptMessage:(WKScriptMessage *)message {
    if (![message.name isEqualToString:@"fetchJSON"]) return;
    NSString *urlString=[message.body isKindOfClass:[NSString class]]?message.body:nil;
    NSURL *url=urlString.length?[NSURL URLWithString:urlString]:nil;
    if (!url || ![url.scheme.lowercaseString isEqualToString:@"https"]) return;
    __weak typeof(self) weakSelf=self;
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        NSHTTPURLResponse *http=(NSHTTPURLResponse *)response;
        NSInteger status=http.statusCode;
        NSString *b64=data.length?[data base64EncodedStringWithOptions:0]:@"";
        NSString *err=error.localizedDescription?:@"";
        NSString *js=[NSString stringWithFormat:@"window.ASCBridgeResolve(%ld,%@,%@);",(long)status,[self jsString:b64],[self jsString:err]];
        dispatch_async(dispatch_get_main_queue(),^{ [weakSelf.webView evaluateJavaScript:js completionHandler:nil]; });
    }] resume];
}
- (NSString *)jsString:(NSString *)s {
    NSData *d=[NSJSONSerialization dataWithJSONObject:@[s?:@""] options:0 error:nil];
    NSString *a=[[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    return [a substringWithRange:NSMakeRange(1,a.length-2)];
}
@end

@interface ASCViewController : UIViewController
@property(nonatomic,strong) WKWebView *webView;
@property(nonatomic,strong) ASCBridge *bridge;
@end

@implementation ASCViewController
- (void)loadView {
    WKWebViewConfiguration *config=[WKWebViewConfiguration new];
    self.webView=[[WKWebView alloc] initWithFrame:CGRectMake(0,0,1,1) configuration:config];
    self.bridge=[ASCBridge new]; self.bridge.webView=self.webView;
    [config.userContentController addScriptMessageHandler:self.bridge name:@"fetchJSON"];
    self.view=self.webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *indexURL=[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"web"];
    NSURL *webURL=[[NSBundle mainBundle] URLForResource:@"web" withExtension:nil];
    if(indexURL&&webURL)[self.webView loadFileURL:indexURL allowingReadAccessToURL:webURL];
}
- (void)dealloc { [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"fetchJSON"]; }
@end

@interface ASCAppDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic,strong) UIWindow *window;
@end
@implementation ASCAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options {
    self.window=[[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController=[ASCViewController new];
    [self.window makeKeyAndVisible];
    NSLog(@"AltSource Center core %@",[NSString stringWithUTF8String:asc_core_version()]);
    return YES;
}
@end

int main(int argc,char *argv[]){@autoreleasepool{return UIApplicationMain(argc,argv,nil,NSStringFromClass([ASCAppDelegate class]));}}