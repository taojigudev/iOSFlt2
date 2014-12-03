//
//  LoginScrollViewController1.m
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/12/1.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "LoginScrollViewController1.h"

@interface LoginScrollViewController1 ()<UITextFieldDelegate>

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
    
    passwordTextField=[[UITextField alloc]initWithFrame:CGRectZero];
    passwordTextField.delegate=self;
    passwordTextField.placeholder=NSLocalizedString(@"Password", nil);
    
    loginButton=[[UIButton alloc]initWithFrame:CGRectZero];
    [loginButton setTitle:NSLocalizedString(@"Login", nil) forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
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
    //[containerView addSubview:<#(UIView *)#>]
}
-(void)addSubViewConstraints{
    
    
    
    NSDictionary*viewDictionray=NSDictionaryOfVariableBindings(scrollView,titleLabel,detailLabel,accountTextField,passwordTextField,loginButton);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:viewDictionray]];
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:viewDictionray]];
     
    
    NSString*verticalVisualFormat=@"V:|-[titleLabel]-[detailLabel]-[accountTextField]-[passwordTextField]|";
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
}

@end
