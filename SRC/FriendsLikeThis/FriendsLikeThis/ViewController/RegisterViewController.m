//
//  RegisterViewController.m
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/11/30.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController (){
    
    @private
    UISegmentedControl *accoutTypeSegmentController;
    
}
@property (strong, nonatomic) IBOutlet UILabel *accountTypeLabel;
@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwrd2TextField;
@property (strong, nonatomic) IBOutlet UITextField *messageCodeTextField;

//@property (strong, nonatomic) IBOutlet UISegmentedControl *accoutTypeSegmentController;

@property (strong, nonatomic) IBOutlet UIButton *sendMessageCodeButton;


@end

@implementation RegisterViewController

@synthesize delegate;
@synthesize accountTypeLabel;
@synthesize accountTextField;
@synthesize passwordTextField;
@synthesize passwrd2TextField;
@synthesize messageCodeTextField;
@synthesize sendMessageCodeButton;


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self initCustomSubViews];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //[self addCustomSubViews];
    
    //[self addSubViewConstraints];
   


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

#pragma mark -- selector and action messages

-(void)loginButtonClicked:(id)sender{
    if (nil!=self.delegate&&[self.delegate performSelector:@selector(willTransToLoginViewController:) withObject:nil]) {
        [self.delegate willTransToLoginViewController:self];
    }
}

-(void)registerButtonClicked:(id)sender{
    //Show the next step of register

}

-(void)accountTypeSegmentIndexChanged:(UISegmentedControl*)segmentControl{
    
}

#pragma mark -- private messages

-(void)initCustomSubViews{
    UIBarButtonItem*loginItem=[[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"Login", nil) style:UIBarButtonItemStylePlain target:self action:@selector(loginButtonClicked:)];
    self.navigationItem.leftBarButtonItem=loginItem;
    UIBarButtonItem*regitsterItem=[[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"Register", nil) style:UIBarButtonItemStylePlain target:self action:@selector(registerButtonClicked:)];
    self.navigationItem.rightBarButtonItem=regitsterItem;
    
    accoutTypeSegmentController=[[UISegmentedControl alloc]initWithItems:@[NSLocalizedString(@"EmailAccount", nil),NSLocalizedString(@"MobileAccount", nil)]];
    accoutTypeSegmentController.hidden=NO;
    accoutTypeSegmentController.momentary=NO;
    [accoutTypeSegmentController addTarget:self action:@selector(accountTypeSegmentIndexChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView=accoutTypeSegmentController;
}

-(void)addSubViewConstraints{
    
    NSDictionary*viewDictionary=NSDictionaryOfVariableBindings(accountTextField,accountTypeLabel,passwordTextField,passwrd2TextField,messageCodeTextField);
    
    
    //self.view.translatesAutoresizingMaskIntoConstraints=NO;
    self.accountTypeLabel.translatesAutoresizingMaskIntoConstraints=NO;
    self.accountTextField.translatesAutoresizingMaskIntoConstraints=NO;
    self.passwrd2TextField.translatesAutoresizingMaskIntoConstraints=NO;
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints=NO;
    self.messageCodeTextField.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSString*verticalFormat=@"V:|-[accountTypeLabel]-[accountTextField]-[passwordTextField]-[passwrd2TextField]-[messageCodeTextField]-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalFormat options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[accountTypeLabel]|" options:0 metrics:nil views:viewDictionary]];
    
}
-(void)addCustomSubViews{
    [self.view addSubview:self.accountTypeLabel];
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.passwrd2TextField];
    [self.view addSubview:self.messageCodeTextField];
}


@end
