//
//  SideMenuViewController.m
//  FriendsLikeThis
//
//  Created by GuJitao on 15/3/3.
//  Copyright (c) 2015年 voole. All rights reserved.
//

#import "SideMenuViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "UIView+REFrostedViewController.h"
#import "REFrostedViewController.h"
#import "TestHhomeViewController2.h"
#import "MenuNavigationController.h"

@interface SideMenuViewController(){
    
}




@end;

@implementation SideMenuViewController

@synthesize startViewController;



#pragma mark -- datasource and delegate messages

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellIdentifer=@"cellIdentifer";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (nil==cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    cell.textLabel.text=@"Hello";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //The navigation controller should be kept
    if (0==indexPath.row) {
       
        self.frostedViewController.contentViewController=self.startViewController;
       
    }
    if (1==indexPath.row) {
        //TestHhomeViewController2*tvc2=[[TestHhomeViewController2 alloc]init];
        //MenuNavigationController*navi2=[[MenuNavigationController alloc]initWithRootViewController:tvc2];
        self.frostedViewController.contentViewController=self.startViewController;
    }
    
    [self.frostedViewController hideMenuViewController];
    return;
}

@end
