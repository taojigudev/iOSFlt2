//
//  WeiboUserInfo.h
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/12/3.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString* const ThirdPartCodeQQ=@"QQ";
static NSString* const ThirdPartCodeSina=@"Sina";

@interface ThirdPartUserInfo : NSObject{
    
}

@property(nonatomic,strong)NSString*thirdPartCode;
@property(nonatomic,strong)NSString*userId;
@property(nonatomic,strong)NSString*token;


+(ThirdPartUserInfo*)sharedInstance;

@end
