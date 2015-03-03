//
//  TestHomeViewController1.m
//  FriendsLikeThis
//
//  Created by GuJitao on 15/3/3.
//  Copyright (c) 2015年 voole. All rights reserved.
//

#import "TestHomeViewController1.h"
#import "MenuNavigationController.h"

@implementation TestHomeViewController1


-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(MenuNavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    return;
}

@end
