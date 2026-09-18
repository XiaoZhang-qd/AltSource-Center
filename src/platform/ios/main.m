#import <UIKit/UIKit.h>
#import "ios_bridge.h"
#import "../../core/urlscheme.h"

@interface ASCViewController : UIViewController @end
@implementation ASCViewController
- (void)viewDidLoad {
 [super viewDidLoad];
 self.title=@"AltSource Center";
 self.view.backgroundColor=UIColor.systemBackgroundColor;
 UIStackView *stack=[UIStackView new]; stack.axis=UILayoutConstraintAxisVertical; stack.spacing=14; stack.translatesAutoresizingMaskIntoConstraints=NO;
 UILabel *title=[UILabel new]; title.text=@"AltSource Center"; title.font=[UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle]; title.textAlignment=NSTextAlignmentCenter;
 UILabel *info=[UILabel new]; info.text=@"Native AltSource browser\nSources • Apps • Sideload"; info.numberOfLines=0; info.textAlignment=NSTextAlignmentCenter;
 UIButton *b=[UIButton buttonWithType:UIButtonTypeSystem]; [b setTitle:@"Supported Sideloaders" forState:UIControlStateNormal]; [b addTarget:self action:@selector(showHandlers) forControlEvents:UIControlEventTouchUpInside];
 [stack addArrangedSubview:title]; [stack addArrangedSubview:info]; [stack addArrangedSubview:b]; [self.view addSubview:stack];
 [NSLayoutConstraint activateConstraints:@[[stack.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:24],[stack.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-24],[stack.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]]];
}
- (void)showHandlers {
 ASCURLHandler h[16]; size_t n=asc_default_handlers(h,16); NSMutableString *s=[NSMutableString string];
 for(size_t i=0;i<n;i++) [s appendFormat:@"%s\n",h[i].name];
 asc_ios_show_alert("Sideloaders",s.UTF8String);
}
@end

@interface ASCAppDelegate:UIResponder<UIApplicationDelegate>
@property(nonatomic,strong) UIWindow *window;
@end
@implementation ASCAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options {
 self.window=[[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
 self.window.rootViewController=[[UINavigationController alloc] initWithRootViewController:[ASCViewController new]];
 [self.window makeKeyAndVisible]; return YES;
}
@end

int main(int argc,char *argv[]){@autoreleasepool{return UIApplicationMain(argc,argv,nil,NSStringFromClass([ASCAppDelegate class]));}}
