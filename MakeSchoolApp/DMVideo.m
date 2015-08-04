//
//  DMVideo.m
//  MakeSchoolApp
//
//  Created by Zouhair Mahieddine on 8/4/15.
//  Copyright (c) 2015 Dailymotion. All rights reserved.
//

#import "DMVideo.h"

@implementation DMVideo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.identifier = dictionary[@"id"];
    self.title = dictionary[@"title"];
    self.thumbnailURLString = dictionary[@"thumbnail_240_url"];
  }
  return self;
}
+ (instancetype)videoWithDictionary:(NSDictionary *)dictionary {
  return [[self alloc] initWithDictionary:dictionary];
}

@end
