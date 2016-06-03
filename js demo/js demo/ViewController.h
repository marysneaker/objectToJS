//
//  ViewController.h
//  js demo
//
//  Created by sinoswr on 16/6/3.
//  Copyright © 2016年 sinoswr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

//首先创建一个实现了JSExport协议的协议
@protocol TestJSObjectProtocol <JSExport>

- (void)SetDataLoggerTime;

@end
@interface ViewController : UIViewController


@end

