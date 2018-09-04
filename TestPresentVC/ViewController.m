//
//  ViewController.m
//  TestPresentVC
//
//  Created by wangxiaoli on 2018/9/3.
//  Copyright © 2018年 王晓莉. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testAction:(id)sender {
    PresentedViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"PresentedViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
