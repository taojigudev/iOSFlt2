//
//  MenuNavigationController.m
//  FriendsLikeThis
//
//  Created by GuJitao on 15/3/3.
//  Copyright (c) 2015年 voole. All rights reserved.
//

#import "MenuNavigationController.h"
#import "UIViewController+REFrostedViewController.h"
#import "UIView+REFrostedViewController.h"
#import "REFrostedViewController.h"

@implementation MenuNavigationController


- (void)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

@end
