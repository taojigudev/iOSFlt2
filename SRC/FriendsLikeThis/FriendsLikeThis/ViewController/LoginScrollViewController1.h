//
//  LoginScrollViewController1.h
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/12/1.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserOperationDelegate.h"


@interface LoginScrollViewController1 : UIViewController{
    @private
    UILabel*titleLabel;
    UILabel*detailLabel;
    UITextField*accountTextField;
    UITextField*passwordTextField;
    UIButton*loginButton;
    UIButton*weiboLoginButton;
    UIButton*qqLoginButton;
    UIButton*forgetPasswordButton;
    UILabel*companyLabel;
    
    UIScrollView*scrollView;
    
}

@property(nonatomic,assign)id<UserOperationDeleate>delegate;

@end
