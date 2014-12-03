//
//  LoginScroolViewController.m
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/11/27.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "LoginScroolViewController.h"

@interface LoginScroolViewController (){
    BOOL keyboardVisible;
}

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UIButton *weiboLoginButton;

@property (strong, nonatomic) IBOutlet UIButton *qqLoginButton;


@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *forgetPasswordButton;

@property (strong, nonatomic) IBOutlet UILabel *companyLabel;




@end

@implementation LoginScroolViewController

@synthesize titleLabel;
@synthesize detailLabel;
@synthesize emailTextField;
@synthesize passwordTextField;
@synthesize scrollView;
@synthesize loginButton;
@synthesize weiboLoginButton;
@synthesize qqLoginButton;
@synthesize companyLabel;
@synthesize forgetPasswordButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self addSubViewConstraints];
    
    scrollView.contentSize=self.view.frame.size;
    scrollView.backgroundColor=[UIColor greenColor];
    [self configureAllViewsMaskIntoConstraints:NO];
    //[self addSubViews2ScrollView];
    [self addSubViews2View];
    [self addLayoutConstraints2];
}

-(void)viewDidAppear:(BOOL)animated{
    [self addNotificationObserver];
}

-(void)viewDidDisappear:(BOOL)animated{
    [self removeNotifcationObserver];
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

-(void)addNotificationObserver{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}
-(void)removeNotifcationObserver{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark-- selector and action messages

-(void)keyboardDidShow:(NSNotification*)notification{
  

    // Get the size of the keyboard.
    NSDictionary* info = [notification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        //self.scrollView.contentOffset=CGPointMake(0, 60);
        //[self.scrollView scr]
    }];
    
    // Keyboard is now visible
    keyboardVisible = YES;
}
-(void)keyboardDidHide:(NSNotification*)notification{
    [UIView animateWithDuration:0.3 animations:^{
                          //self.scrollView.contentOffset=CGPointZero;
        //self.scrollView.contentOffset=CGPointZero;
    }];
    
   
}

#pragma mark -- private messages


-(void)addLayoutConstraints2{
    
    NSDictionary*viewDictionary=NSDictionaryOfVariableBindings(scrollView,titleLabel,detailLabel,emailTextField,passwordTextField,loginButton,weiboLoginButton,qqLoginButton,forgetPasswordButton,companyLabel);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:viewDictionary]];
 
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[detailLabel]|" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(50)-[emailTextField]-(50)-|" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(50)-[passwordTextField]-(50)-|" options:0 metrics:nil views:viewDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[loginButton]|" options:0 metrics:nil views:viewDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=20)-[titleLabel]-[detailLabel]-(==20)-[emailTextField(40)]-(20)-[passwordTextField(40)]-(>=20)-[loginButton]-[weiboLoginButton]-[forgetPasswordButton]-[companyLabel]-(>=30)-|" options:0 metrics:nil views:viewDictionary]];
    
}

-(void)addLayoutConstraints{
    
    
    NSDictionary*viewDictionary=NSDictionaryOfVariableBindings(scrollView, titleLabel,detailLabel,emailTextField,passwordTextField,loginButton,weiboLoginButton,qqLoginButton,forgetPasswordButton,companyLabel);
    
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:viewDictionary]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[detailLabel]-|" options:0 metrics:nil views:viewDictionary]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(50)-[emailTextField]-(50)-|" options:0 metrics:nil views:viewDictionary]];
    
    NSLayoutConstraint*centerConstraint=[NSLayoutConstraint constraintWithItem:self.passwordTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.emailTextField attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.scrollView addConstraint:centerConstraint];
    
    NSLayoutConstraint *widthContraint=nil;
    widthContraint=[NSLayoutConstraint constraintWithItem:self.emailTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.passwordTextField attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.scrollView addConstraint:widthContraint];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[weiboLoginButton]-[qqLoginButton(==weiboLoginButton)]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDictionary]];
    
    NSString*verticalVisualFormat=@"V:|-(1)-[titleLabel(<=60)]-(<=10)-[detailLabel(<=30)]-[emailTextField(40)]-[passwordTextField(==emailTextField)]-(40)-[loginButton]-(20)-[weiboLoginButton]-[forgetPasswordButton]-[companyLabel]-(>=10)-|";
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat options:0 metrics:nil views:viewDictionary]];
}

-(void)addSubViews2ScrollView{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleLabel];
    [self.scrollView addSubview:self.detailLabel];
    [self.scrollView addSubview:self.emailTextField];
    [self.scrollView addSubview:self.passwordTextField];
    [self.scrollView addSubview:self.loginButton];
    [self.scrollView addSubview:self.qqLoginButton];
    [self.scrollView addSubview:self.weiboLoginButton];
    [self.scrollView addSubview:self.forgetPasswordButton];
    [self.scrollView addSubview:companyLabel];
}

-(void)addSubViews2View{
    
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.detailLabel];
    [self.view addSubview:self.emailTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.qqLoginButton];
    [self.view addSubview:self.weiboLoginButton];
    [self.view addSubview:self.forgetPasswordButton];
    [self.view addSubview:companyLabel];
}

-(void)addSubViewConstraints{
    


    //[self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|" options:0 metrics:nil views:viewDictionary]];

}

-(void)configureAllViewsMaskIntoConstraints:(BOOL)flag{
    
    
    self.view.translatesAutoresizingMaskIntoConstraints=flag;
    self.scrollView.translatesAutoresizingMaskIntoConstraints=flag;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints=flag;
    self.detailLabel.translatesAutoresizingMaskIntoConstraints=flag;
    self.emailTextField.translatesAutoresizingMaskIntoConstraints=flag;
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints=flag;
    self.loginButton.translatesAutoresizingMaskIntoConstraints=flag;
    self.weiboLoginButton.translatesAutoresizingMaskIntoConstraints=flag;
    self.qqLoginButton.translatesAutoresizingMaskIntoConstraints=flag;
    self.forgetPasswordButton.translatesAutoresizingMaskIntoConstraints=flag;
    self.companyLabel.translatesAutoresizingMaskIntoConstraints=flag;
    
}


@end
