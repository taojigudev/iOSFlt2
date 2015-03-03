//
//  WeiboUserInfo.h
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/12/3.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBAuthorizeResponse;

static NSString* const ThirdPartDidLoginNotification=@"ThirdPartDidLoginNofitication";
static NSString* const ThirdPartDidLogoutNotification=@"ThirdPartDidLogoutNotification";


static NSString* const ThirdPartNotificationThirdPartNameKey=@"ThirdPartNameKey";


static NSString* const ThirdPartCodeQQ=@"QQ";
static NSString* const ThirdPartCodeSina=@"Sina";
static NSString* const ThirdPartCodeFlt=@"Flt";

@interface ThirdPartUserInfo : NSObject{
    
}

@property(nonatomic,strong)NSString*thirdPartCode;
@property(nonatomic,strong)NSString*accountId;//openid
@property(nonatomic,strong)NSString*accountName;
@property(nonatomic,strong)NSString*token;


+(ThirdPartUserInfo*)sharedInstance;

+(ThirdPartUserInfo*)userInfoFromWeiboResponse:(WBAuthorizeResponse*)response;

@end
