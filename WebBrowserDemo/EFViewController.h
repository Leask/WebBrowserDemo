//
//  EFViewController.h
//  WebBrowserDemo
//
//  Created by 0day on 13-8-26.
//  Copyright (c) 2013年 exfe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EFViewController : UIViewController
<
UIWebViewDelegate,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)forwardButtonPressed:(id)sender;
- (IBAction)reloadButtonPressed:(id)sender;
- (IBAction)searchButtonPressed:(id)sender;

@end
