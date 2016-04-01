//
//  ViewController.m
//  jsAndOc
//
//  Created by 张广洋 on 16/3/15.
//  Copyright © 2016年 张广洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIWebViewDelegate>
    
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

/*
 
 HTML：级文本标记语言是标准通用标记语言下的一个应用，也是一种规范，一种标准，它通过标记符号来标记要显示的网页中的各个部分。网页文件本身是一种文本文件，通过在文本文件中添加标记符，可以告诉浏览器如何显示其中的内容（如：文字如何处理，画面如何安排，图片如何显示等）。浏览器按顺序阅读网页文件，然后根据标记符解释和显示其标记的内容，对书写出错的标记将不指出其错误，且不停止其解释执行过程，编制者只能通过显示效果来分析出错原因和出错部位。但需要注意的是，对于不同的浏览器，对同一标记符可能会有不完全相同的解释，因而可能会有不同的显示效果。
 
 JavaScript：一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，最早是在HTML（标准通用标记语言下的一个应用）网页上使用，用来给HTML网页增加动态功能。
 
 CSS：层叠样式表是一种用来表现HTML（标准通用标记语言的一个应用）或XML（标准通用标记语言的一个子集）等文件样式的计算机语言。
 
 HTML DOM：当网页被加载时，浏览器会创建页面的文档对象模型（Document Object Model）。
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSURL * URL=[NSURL URLWithString:@"http://zhangguangyangdemacbook-pro.local/share/NetTest/look.html"];
//    NSURLRequest * request=[NSURLRequest requestWithURL:URL];
//    [self.webView loadRequest:request];
    NSURL * URL=[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"look" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:URL];
    
}
    
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString * URLStr=request.URL.description;
    if ([URLStr hasPrefix:@"yang://"]) {
        NSLog(@"这里是从JS调用的方法");
        if ([URLStr hasPrefix:@"yang://buy?"]) {
            NSLog(@"执行购买操作");
            //我就不解析url了
            [self buyWithId:URLStr];
        }
        return NO;
    }
    return YES;
}


- (IBAction)调用js:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"fromOC('嘿嘿嘿')"];
}

- (IBAction)调用js求和:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"add()"];
}

- (IBAction)创建条件:(id)sender {
//    [self.webView stringByEvaluatingJavaScriptFromString:@"function myOne(){document.getElementById(\"div2\").style.background=\"purple\"};myOne()"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"div2\").style.background=\"purple\""];
}

//oc中的购买方法
-(void)buyWithId:(NSString *)goodId{
    NSLog(@"开始执行OC购买：%@",goodId);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
