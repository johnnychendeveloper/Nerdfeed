//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by JohnnyChen on 16/10/25.
//  Copyright © 2016年 YY.Inc. All rights reserved.
//

#import "BNRWebViewController.h"

@interface BNRWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView *webView;
@property(nonatomic,strong) UIBarButtonItem *backButton;
@property(nonatomic,strong) UIBarButtonItem *forwardButton;
@end

@implementation BNRWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.barTintColor = [UIColor darkGrayColor];
    //self.navigationController.toolbar.backgroundColor = [UIColor redColor];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    _backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(navigateWebView:)];
    _forwardButton = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStylePlain target:self action:@selector(navigateWebView:)];
    
    NSArray *barButtonItemArray = [[NSArray alloc] initWithObjects:_backButton,flexibleSpace,_forwardButton, nil];
    self.toolbarItems = barButtonItemArray;
    
    //_webView = [[UIWebView alloc] init];
    _webView.frame = self.view.bounds;
    [self.view addSubview:_webView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.backButton setEnabled:[webView canGoBack]];
    [self.forwardButton setEnabled:[webView canGoForward]];
}

-(void)navigateWebView:(UIBarButtonItem*)sender
{
    if(sender == self.backButton)
    {
        [self.webView goBack];
    }
    if(sender == self.forwardButton)
    {
        [self.webView goForward];
    }
    
}

/*-(void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}*/

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
    }
    return self;
}

-(void)setURL:(NSURL *)URL
{
    _URL = URL;
    if(_URL)
    {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [self.webView loadRequest:req];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Courses";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    if(barButtonItem == self.navigationItem.leftBarButtonItem)
    {
        self.navigationItem.leftBarButtonItem = nil;
    }
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
