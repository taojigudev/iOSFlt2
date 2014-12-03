//
//  LoginScrollViewController1.m
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/12/1.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "LoginScrollViewController1.h"

#import "WBHttpRequest.h"
#import "WBHttpRequest+WeiboUser.h"
#import "WBHttpRequest+WeiboToken.h"
#import "WeiboSDK.h"
#import "ThirdPartUserInfo.h"

@interface LoginScrollViewController1 ()<UITextFieldDelegate,WeiboSDKDelegate>

@end

@implementation LoginScrollViewController1

-(instancetype)init{
    self=[super init];
    if (nil!=self) {
        
    }
    return self;
}


-(void)loadView{
    [super loadView];
    [self initSubViews];
    [self.view addSubview:scrollView];
    [self addSubViews2View:scrollView];
    [self configureTransitionFlag:NO];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self addSubViewConstraints];
}

#pragma mark -- selector messages

-(void)qqloginButtonClicked:(id)sender{
    
}
-(void)weibologinButtonClicked:(id)sender{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = WeiboRedirectURL;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"LoginCrollVeiwController1",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}
-(void)loginButtonClicked:(id)sender{
    
}

#pragma mark -- weibo delegate message

-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    if ([response isKindOfClass:[WBAuthorizeResponse class]]) {
        WBAuthorizeResponse*war=(WBAuthorizeResponse*)response;
        [ThirdPartUserInfo sharedInstance].thirdPartCode=ThirdPartCodeSina;
        [ThirdPartUserInfo sharedInstance].userId=war.userID;
        [ThirdPartUserInfo sharedInstance].token=war.accessToken;
        
    }
}
-(void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    
}
#pragma mark -- private messages

-(void)initSubViews{
    self.title=NSLocalizedString(@"Login", nil);
    titleLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    titleLabel.backgroundColor=[UIColor redColor];
    titleLabel.text=NSLocalizedString(@"LoginUI", nil);

    detailLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    detailLabel.backgroundColor=[UIColor yellowColor];
    
    accountTextField=[[UITextField alloc]initWithFrame:CGRectZero];
    accountTextField.delegate=self;
    accountTextField.placeholder=NSLocalizedString(@"EmailOrMobile", nil);
    accountTextField.backgroundColor=[UIColor whiteColor];
    
    passwordTextField=[[UITextField alloc]initWithFrame:CGRectZero];
    passwordTextField.delegate=self;
    passwordTextField.placeholder=NSLocalizedString(@"Password", nil);
    passwordTextField.backgroundColor=[UIColor whiteColor];
    
    loginButton=[[UIButton alloc]initWithFrame:CGRectZero];
    [loginButton setTitle:NSLocalizedString(@"Login", nil) forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    qqLoginButton=[[UIButton alloc]initWithFrame:CGRectZero];
    [qqLoginButton setTitle:NSLocalizedString(@"QQLogin", nil) forState:UIControlStateNormal];
    [qqLoginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [qqLoginButton addTarget:self action:@selector(qqloginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    weiboLoginButton=[[UIButton alloc]initWithFrame:CGRectZero];
    [weiboLoginButton setTitle:NSLocalizedString(@"WeiboLogin", nil) forState:UIControlStateNormal];
    [weiboLoginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [weiboLoginButton addTarget:self action:@selector(weibologinButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectZero];
    scrollView.backgroundColor=[UIColor greenColor];

    //[self addSubViews2ScrollView];

    [self configureTransitionFlag:NO];
    
}


-(void)addSubViews2View:(UIView*)containerView{
    [containerView addSubview:titleLabel];
    [containerView addSubview:detailLabel];
    [containerView addSubview:accountTextField];
    [containerView addSubview:passwordTextField];
    [containerView addSubview:loginButton];
    [containerView addSubview:qqLoginButton];
    [containerView addSubview:weiboLoginButton];
    //[containerView addSubview:;
}
-(void)addSubViewConstraints{
    
    
    
    NSDictionary*viewDictionray=NSDictionaryOfVariableBindings(scrollView,titleLabel,detailLabel,accountTextField,passwordTextField,loginButton,weiboLoginButton,qqLoginButton);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:viewDictionray]];
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:viewDictionray]];
     
    
    NSString*verticalVisualFormat=@"V:|-[titleLabel]-[detailLabel]-[accountTextField]-[passwordTextField]-[loginButton]-[weiboLoginButton]-[qqLoginButton]-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat options:0 metrics:nil views:viewDictionray]];
    
}

-(void)configureTransitionFlag:(BOOL)flag{
    self.view.translatesAutoresizingMaskIntoConstraints=YES;
    scrollView.translatesAutoresizingMaskIntoConstraints=flag;
    titleLabel.translatesAutoresizingMaskIntoConstraints=flag;
    detailLabel.translatesAutoresizingMaskIntoConstraints=flag;
    accountTextField.translatesAutoresizingMaskIntoConstraints=flag;
    passwordTextField.translatesAutoresizingMaskIntoConstraints=flag;
    loginButton.translatesAutoresizingMaskIntoConstraints=flag;
    weiboLoginButton.translatesAutoresizingMaskIntoConstraints=flag;
    qqLoginButton.translatesAutoresizingMaskIntoConstraints=flag;
}

@end
