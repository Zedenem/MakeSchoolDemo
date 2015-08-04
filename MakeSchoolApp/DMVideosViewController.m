//
//  ViewController.m
//  MakeSchoolApp
//
//  Created by Zouhair Mahieddine on 8/4/15.
//  Copyright (c) 2015 Dailymotion. All rights reserved.
//

#import "DMVideosViewController.h"
#import "DMVideo.h"
#import "DMVideoCollectionViewCell.h"

@interface DMVideosViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *videos;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end

@implementation DMVideosViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSURLSession *urlSession = [NSURLSession sharedSession];
  
  self.videos = [NSMutableArray array];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.dailymotion.com/videos?list=what-to-watch&limit=30&page=1&fields=id,owner_screenname,duration,title,thumbnail_240_url,views_total,created_time,channel.name"]];
  NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                   NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                                   NSArray *videosJSON = JSON[@"list"];
                                                   for (NSDictionary *videoJSON in videosJSON) {
                                                     [self.videos addObject:[DMVideo videoWithDictionary:videoJSON]];
                                                   }
                                                   dispatch_sync(dispatch_get_main_queue(), ^{
                                                     [self.collectionView reloadData];
                                                   });
                                                 }];
  [dataTask resume];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionViewDataSource & UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.videos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  DMVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCell" forIndexPath:indexPath];
  
  DMVideo *video = self.videos[indexPath.item];
  cell.titleLabel.text = video.title;
  [cell setImageWithURL:[NSURL URLWithString:video.thumbnailURLString]];
  
  return cell;
}

@end
