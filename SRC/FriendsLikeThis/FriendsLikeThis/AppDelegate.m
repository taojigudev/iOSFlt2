//
//  AppDelegate.m
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/11/25.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "AppDelegate.h"
#import "ICETutorialController.h"
#import "ICETutorialStyle.h"
#import "ICETutorialPage.h"

#import "RegisterViewController.h"
#import "LoginScrollViewController.h"
#import "UserOperationDelegate.h"

#import "LoginScrollViewController1.h"
#import "WeiboSDK.h"
#import "REFrostedViewController.h"
#import "MenuNavigationController.h"
#import "SideMenuViewController.h"
#import "TestHomeViewController1.h"

@interface AppDelegate ()<ICETutorialControllerDelegate,UserOperationDeleate,WeiboSDKDelegate,REFrostedViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:WeiboAppKey];
    
   [self iceTutorialViewController];
    
    return YES;
    
    // Override point for customization after application launch.
    //self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    //ICETutorialController*tutorialViewController=[self iceTutorialViewController];
    //self.window.rootViewController=tutorialViewController;
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WeiboSDK handleOpenURL:url delegate:self];
    
}
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -- custome delegate messages

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if (response.statusCode==WeiboSDKResponseStatusCodeSuccess&&[response class]==[WBAuthorizeResponse class]) {
        
        WBAuthorizeResponse*authResponse=(WBAuthorizeResponse*)response;
        NSLog(@"User id  is %@",authResponse.userID);
        NSLog(@"token is %@",authResponse.accessToken);
        
        [self presentMainViewController];
    }
}

-(void)tutorialController:(ICETutorialController *)tutorialController didClickOnLeftButton:(UIButton *)sender{
    
    [self showRegisterViewController];

}

-(void)tutorialController:(ICETutorialController *)tutorialController didClickOnRightButton:(UIButton *)sender{

    [self showLoginViewController];
  
}

-(void)willTransToLoginViewController:(UIViewController *)viewcontroller{
    [self showLoginViewController];
}
-(void)willTransToRegisterViewContrller:(UIViewController *)viewcontroller{
    [self showRegisterViewController];
}

#pragma mark -- private messages


-(void)showLoginViewController{
    //UIStoryboard*storyboard=[UIStoryboard storyboardWithName:StoryBoardFileName bundle:nil];
    //NSString*className=NSStringFromClass([LoginScrollViewController class]);
    
    //LoginScrollViewController*lsvc=(LoginScrollViewController*)[storyboard instantiateViewControllerWithIdentifier:className];
    LoginScrollViewController1*lsvc=[[LoginScrollViewController1 alloc]init];
    lsvc.delegate=self;
    
    
    UINavigationController*navi=[[UINavigationController alloc]initWithRootViewController:lsvc];
    navi.navigationBar.translucent=NO;
    
    self.window.rootViewController=navi;
}
-(void)showRegisterViewController{
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:StoryBoardFileName bundle:nil];
    NSString*className=NSStringFromClass([RegisterViewController class]);
    RegisterViewController*rvc=[storyboard instantiateViewControllerWithIdentifier:className];
    rvc.delegate=self;
    UINavigationController*navi=[[UINavigationController alloc]initWithRootViewController:rvc];
    
    navi.navigationBar.translucent=NO;
    self.window.rootViewController=navi;
}
-(ICETutorialController*)iceTutorialViewController{
    
    
    [[ICETutorialStyle sharedInstance] setTitleFont:[UIFont systemFontOfSize:20]];
    
    ICETutorialPage*page0=[[ICETutorialPage alloc]initWithTitle:@"Title0" subTitle:@"" pictureName:@"Introduction0" duration:1];
    
    ICETutorialPage* page1=[[ICETutorialPage alloc]initWithTitle:@"Title1" subTitle:@"SubTitle1" pictureName:@"Introduction1" duration:1];

    NSArray*pageArray=@[page0,page1];
    ICETutorialController*resultController=(ICETutorialController*)self.window.rootViewController;
    resultController.delegate=self;
    [resultController setPages:pageArray];
    return resultController;
    
}

#pragma mark -- private messages

-(void)presentMainViewController{
    
    SideMenuViewController*smvc=[[SideMenuViewController alloc]initWithStyle:UITableViewStylePlain];
  
    TestHomeViewController1*thvc1=[[TestHomeViewController1 alloc]init];
   
    
    
    MenuNavigationController*navigationController=[[MenuNavigationController alloc]initWithRootViewController:thvc1];
    
    UINavigationController*menuNavi=[[UINavigationController alloc]initWithRootViewController:smvc];
    
    smvc.startViewController=navigationController;
    
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:menuNavi];
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    frostedViewController.liveBlur = YES;
    frostedViewController.delegate = self;
    
    
    self.window.rootViewController=frostedViewController;
    
}

@end
