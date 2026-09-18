#import <UIKit/UIKit.h>
#import "ios_bridge.h"
void asc_ios_open_url(const char *url){
 if(!url)return; NSString *s=[NSString stringWithUTF8String:url]; NSURL *u=[NSURL URLWithString:s]; if(!u)return;
 dispatch_async(dispatch_get_main_queue(),^{[[UIApplication sharedApplication] openURL:u options:@{} completionHandler:nil];});
}
void asc_ios_show_alert(const char *title,const char *message){
 NSString *t=title?[NSString stringWithUTF8String:title]:@"AltSource Center";
 NSString *m=message?[NSString stringWithUTF8String:message]:@"";
 dispatch_async(dispatch_get_main_queue(),^{
  UIViewController *root=UIApplication.sharedApplication.keyWindow.rootViewController;if(!root)return;
  UIAlertController *a=[UIAlertController alertControllerWithTitle:t message:m preferredStyle:UIAlertControllerStyleAlert];
  [a addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
  [root presentViewController:a animated:YES completion:nil];
 });
}
