#import <UIKit/UIKit.h>
#import "ios_bridge.h"
#import "../../core/urlscheme.h"
#import "../../core/locale.h"

@interface ASCViewController : UIViewController @end
@implementation ASCViewController
- (void)viewDidLoad {
 [super viewDidLoad];
 self.view.backgroundColor=[UIColor whiteColor];
 self.title=@"AltSource Center";
 UIStackView *stack=[UIStackView new]; stack.axis=UILayoutConstraintAxisVertical; stack.spacing=14; stack.translatesAutoresizingMaskIntoConstraints=NO;
 UILabel *title=[UILabel new]; title.text=@"AltSource Center"; title.font=[UIFont boldSystemFontOfSize:28]; title.textAlignment=NSTextAlignmentCenter;
 UILabel *info=[UILabel new]; info.text=@"Native AltSource browser\nSources • Apps • Sideload"; info.numberOfLines=0; info.textAlignment=NSTextAlignmentCenter;
 UIButton *b=[UIButton buttonWithType:UIButtonTypeSystem]; [b setTitle:@"Supported Sideloaders" forState:UIControlStateNormal]; [b addTarget:self action:@selector(showHandlers) forControlEvents:UIControlEventTouchUpInside];
 UIButton *lang=[UIButton buttonWithType:UIButtonTypeSystem]; [lang setTitle:@"Language" forState:UIControlStateNormal]; [lang addTarget:self action:@selector(selectLanguage) forControlEvents:UIControlEventTouchUpInside];
 [stack addArrangedSubview:title]; [stack addArrangedSubview:info]; [stack addArrangedSubview:b]; [stack addArrangedSubview:lang]; [self.view addSubview:stack];
 UILayoutGuide *g=self.view.layoutMarginsGuide;
 [NSLayoutConstraint activateConstraints:@[[stack.leadingAnchor constraintEqualToAnchor:g.leadingAnchor],[stack.trailingAnchor constraintEqualToAnchor:g.trailingAnchor],[stack.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]]];
}
- (void)showHandlers { ASCURLHandler h[16]; size_t n=asc_default_handlers(h,16); NSMutableString*s=[NSMutableString string];for(size_t i=0;i<n;i++)[s appendFormat:@"%s\n",h[i].name];asc_ios_show_alert("Sideloaders",s.UTF8String); }
- (void)selectLanguage {
 UIAlertController*a=[UIAlertController alertControllerWithTitle:@"Language" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
 for(int i=0;i<6;i++){ASCLanguage l=(ASCLanguage)i;[a addAction:[UIAlertAction actionWithTitle:[NSString stringWithUTF8String:asc_language_name(l)] style:UIAlertActionStyleDefault handler:^(UIAlertAction*x){[[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithUTF8String:asc_language_code(l)] forKey:@"ASC.language"];}]];}
 [a addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];[self presentViewController:a animated:YES completion:nil];
}
@end
@interface ASCAppDelegate:UIResponder<UIApplicationDelegate>@property(nonatomic,strong)UIWindow*window;@end
@implementation ASCAppDelegate
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)options{self.window=[[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];self.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:[ASCViewController new]];[self.window makeKeyAndVisible];return YES;}
@end
int main(int argc,char*argv[]){@autoreleasepool{return UIApplicationMain(argc,argv,nil,NSStringFromClass([ASCAppDelegate class]));}}
