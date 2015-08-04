//
//  DMVideo.h
//  MakeSchoolApp
//
//  Created by Zouhair Mahieddine on 8/4/15.
//  Copyright (c) 2015 Dailymotion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMVideo : NSObject

@property(nonatomic, strong) NSString *identifier;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *thumbnailURLString;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)videoWithDictionary:(NSDictionary *)dictionary;

@end
