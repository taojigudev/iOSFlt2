//
//  TestHhomeViewController2.m
//  FriendsLikeThis
//
//  Created by GuJitao on 15/3/3.
//  Copyright (c) 2015年 voole. All rights reserved.
//

#import "TestHhomeViewController2.h"
#import "MenuNavigationController.h"

@implementation TestHhomeViewController2


-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(MenuNavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    return;
}

@end
