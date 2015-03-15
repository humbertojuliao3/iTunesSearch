//
//  SingDetail.h
//  iTunesSearch
//
//  Created by Humberto  Julião on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingDetail : NSObject
@property NSArray* itens;

+ (SingDetail *)sharedInstance;
-(void)ida:(NSArray *)valores;

@end
