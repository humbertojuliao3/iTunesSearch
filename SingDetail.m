//
//  SingDetail.m
//  iTunesSearch
//
//  Created by Humberto  Julião on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "SingDetail.h"

@implementation SingDetail
@synthesize itens;
static SingDetail * SINGLETON = nil;

static bool isFirstAccess = YES;

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    
    
    return SINGLETON;
}

-(void)ida:(NSArray *)valores{
    self.itens=valores;
}

@end
