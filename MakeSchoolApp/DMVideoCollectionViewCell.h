//
//  DMVideoCollectionViewCell.h
//  MakeSchoolApp
//
//  Created by Zouhair Mahieddine on 8/4/15.
//  Copyright (c) 2015 Dailymotion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMVideoCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) IBOutlet UILabel *titleLabel;
@property(nonatomic, strong) IBOutlet UIImageView *thumbnailImageView;

- (void)setImageWithURL:(NSURL *)imageURL;

@end
