//
//  WeiboUserInfo.m
//  FriendsLikeThis
//
//  Created by VooleDev6 on 14/12/3.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "ThirdPartUserInfo.h"

@implementation ThirdPartUserInfo{
    
}

@synthesize thirdPartCode;
@synthesize userId;
@synthesize token;


+(ThirdPartUserInfo*)sharedInstance{
    static ThirdPartUserInfo*instance=nil;
    if (nil==instance) {
        dispatch_once_t once;
        dispatch_once(&once, ^{
            instance=[ThirdPartUserInfo new];
        });
    }
    return instance;
}


@end
