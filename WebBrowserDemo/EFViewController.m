//
//  EFViewController.m
//  WebBrowserDemo
//
//  Created by 0day on 13-8-26.
//  Copyright (c) 2013年 exfe. All rights reserved.
//

#import "EFViewController.h"

@interface EFViewController ()

@end

@implementation EFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"@cfd, WebView shouldStartLoadWithRequest:%@ navigationType:%d", request, navigationType);
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"@cfd, WebView did start load.");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"@cfd, WebView did finish load.");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"@cfd, WebView did fail load. %@", error);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendRequest];
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark -

- (void)sendRequest {
    NSString *urlString = self.textField.text;
    if (![urlString hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"https://%@", urlString];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    /**
     User-Agent: Mozilla/5.0 (Linux; U; Android 4.3; en-us; Nexus 7 Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 MicroMessenger/5.0.351
     */
    [request addValue:@"Mozilla/5.0 (Linux; U; Android 4.3; en-us; Nexus 7 Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 MicroMessenger/5.0.351" forHTTPHeaderField:@"User-Agent"];
    [self.webView loadRequest:request];
}

#pragma mark - Action

- (IBAction)backButtonPressed:(id)sender {
    [self.webView goBack];
}

- (IBAction)forwardButtonPressed:(id)sender {
    [self.webView goForward];
}

- (IBAction)reloadButtonPressed:(id)sender {
    [self.webView reload];
}

- (IBAction)searchButtonPressed:(id)sender {
    [self sendRequest];
}

@end
