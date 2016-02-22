//
//  CourseViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/31.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "CourseViewController.h"
#import "SSVideoPlayController.h"
#import "SSVideoPlayContainer.h"
@interface CourseViewController ()
- (IBAction)player:(id)sender;

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    kNavBackColor;
    self.navigationItem.title = self.titleValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)player:(id)sender {
    NSArray *paths = @[@"http://data.vod.itc.cn/?prod=app&new=/194/216/JBUeCIHV4s394vYk3nbgt2.mp4",
                       @"http://data.vod.itc.cn/?prod=app&new=/5/36/aUe9kB0906IvkI5UCpq11K.mp4",
                       @"http://data.vod.itc.cn/?prod=app&new=/10/66/eCGPkAewSVqy9P57hvB11D.mp4",
                       @"http://data.vod.itc.cn/?prod=app&new=/125/206/g586XlZhJQBGTnFDS75cPF.mp4"
                       ];
    NSArray *names = @[@"First Love",@"I Kiss You in My Dreams",@"Take You Over",@"Keep Finding a Way"];
    NSMutableArray *videoList = [NSMutableArray array];
    for (NSInteger i = 0; i<paths.count; i++) {
        SSVideoModel *model = [[SSVideoModel alloc]init];
        model.path = paths[i];
        model.name = names[i];
        [videoList addObject:model];
    }
    SSVideoPlayController *playController = [[SSVideoPlayController alloc]initWithVideoList:videoList];
    SSVideoPlayContainer *playContainer = [[SSVideoPlayContainer alloc]initWithRootViewController:playController];
    [self presentViewController:playContainer animated:NO completion:nil];
}




@end
