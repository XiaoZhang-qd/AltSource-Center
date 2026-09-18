#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface ASCViewController:UIViewController
@property(nonatomic,strong) WKWebView *webView;
@end
@implementation ASCViewController
- (void)loadView {
 WKWebViewConfiguration *config=[WKWebViewConfiguration new];
 self.webView=[[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
 self.view=self.webView;
}
- (void)viewDidLoad {
 [super viewDidLoad];
 NSURL *indexURL=[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"web"];
 NSURL *webURL=[[NSBundle mainBundle] URLForResource:@"web" withExtension:nil];
 if(indexURL && webURL) [self.webView loadFileURL:indexURL allowingReadAccessToURL:webURL];
}
@end
@interface ASCAppDelegate:UIResponder<UIApplicationDelegate>
@property(nonatomic,strong) UIWindow *window;
@end
@implementation ASCAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options {
 self.window=[[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
 self.window.rootViewController=[ASCViewController new];
 [self.window makeKeyAndVisible];
 return YES;
}
@end
int main(int argc,char *argv[]){@autoreleasepool{return UIApplicationMain(argc,argv,nil,NSStringFromClass([ASCAppDelegate class]));}}