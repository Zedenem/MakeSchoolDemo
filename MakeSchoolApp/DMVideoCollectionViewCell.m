//
//  DMVideoCollectionViewCell.m
//  MakeSchoolApp
//
//  Created by Zouhair Mahieddine on 8/4/15.
//  Copyright (c) 2015 Dailymotion. All rights reserved.
//

#import "DMVideoCollectionViewCell.h"

@interface DMVideoCollectionViewCell ()

@property (nonatomic, strong) NSURLSessionDataTask *imageDataTask;

@end

@implementation DMVideoCollectionViewCell

- (void)prepareForReuse {
  [super prepareForReuse];
  [self.imageDataTask cancel];
  self.thumbnailImageView.image = nil;
}

- (void)setImageWithURL:(NSURL *)imageURL {
  NSURLSession *urlSession = [NSURLSession sharedSession];
  self.imageDataTask = [urlSession dataTaskWithURL:imageURL
                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                   UIImage *thumbnailImage = [UIImage imageWithData:data];
                                   dispatch_sync(dispatch_get_main_queue(), ^{
                                     self.thumbnailImageView.image = thumbnailImage;
                                   });
                                 }];
  [self.imageDataTask resume];
}

@end
