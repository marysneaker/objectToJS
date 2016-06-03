//
//  ViewController.m
//  js demo
//
//  Created by sinoswr on 16/6/3.
//  Copyright © 2016年 sinoswr. All rights reserved.
//

#import "ViewController.h"

#define JSOBJECT   @"Swr_JS_API"
#define CONTEXTPATH    @"documentView.webView.mainFrame.javaScriptContext"


@interface ViewController ()<UIWebViewDelegate,TestJSObjectProtocol>
{
    UIWebView *web;
    NSString *JSObject;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JSObject=JSOBJECT;
    
    web= [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    web.layer.borderWidth = 0;
    [self.view addSubview:web];
    web.delegate = self;
    web.backgroundColor = [UIColor clearColor];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"test_Demo"];
    
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    

}

#pragma mark -- webViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    JSContext *context = [web valueForKeyPath:CONTEXTPATH];
   
//self传给js
    context[@"testobject"]=self;
    
    
    NSString *jsCodeStr = [NSString stringWithFormat:@"var %@ = new Swr_API()", JSOBJECT];
    
    [context evaluateScript:jsCodeStr];

    
    [self upToJs];
}

//上传数据给js
- (void)upToJs
{
    JSContext *context = [web valueForKeyPath:CONTEXTPATH];
    context [@"string"] = @"王琪吃屎";
    // usleep(10*NSEC_PER_USEC);
    
    // [context evaluateScript: @"Swr_JS_API.DisplayDataLogger(arr)"];
    [context evaluateScript:[self getJsCode:@"JSMethod(string)"]];
}

//js掉oc的方法
-(void)SetDataLoggerTime
{
    NSLog(@"js掉oc的方法");
    
}



-(NSString*)getJsCode:(NSString *)apiName
{
    NSString *codeStr = [NSString stringWithFormat:@"%@.%@",JSObject,apiName];
    return codeStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
