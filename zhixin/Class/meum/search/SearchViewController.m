//
//  SearchViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/25.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%d",_searchType);
    self.navigationItem.title = @"搜索";
    self.navigationController.navigationBar.tintColor = kWhite;
    self.searchBar.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

@end
