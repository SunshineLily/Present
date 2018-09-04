//
//  PresentedViewController.m
//  TestPresentVC
//
//  Created by wangxiaoli on 2018/9/3.
//  Copyright © 2018年 王晓莉. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString *urlStr;
@property (nonatomic, assign) BOOL flag;
@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadRequest];
}

- (void)loadRequest
{
    self.urlStr = @"https://dev.qingkepay.com:10080/demo.html";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    [self.webView loadRequest:request];
}

#pragma mark --UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

#pragma mark --解决方案一
- (UIViewController *)presentingViewController
{
    if (_flag) {
        return nil;
    } else {
        return [super presentingViewController];
    }
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    NSLog(@"viewControllerToPresent:%@",viewControllerToPresent);
    if ([viewControllerToPresent isKindOfClass:[UIDocumentMenuViewController class]]  || [viewControllerToPresent isKindOfClass:[UIImagePickerController class]]) {
        _flag = YES;
    }
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}


/*
 #pragma mark --解决方案二
-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    if (self.presentedViewController)
    {
        [super dismissViewControllerAnimated:flag completion:completion];
    }
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
