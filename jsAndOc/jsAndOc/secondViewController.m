//
//  secondViewController.m
//  jsAndOc
//
//  Created by 张广洋 on 16/3/16.
//  Copyright © 2016年 张广洋. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()
    
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL * URL=[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"look" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:URL];
}

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
