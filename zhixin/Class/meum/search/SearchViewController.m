//
//  SearchViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/25.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
- (IBAction)cancle:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)click1:(id)sender;
- (IBAction)click2:(id)sender;
- (IBAction)click3:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [Help keyBoardDownWithController:self];
    [Help setImageCircular:self.btn1];
    [Help setImageCircular:self.btn2];
    [Help setImageCircular:self.btn3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)keyBoardDown:(id)sender {
    [self.searchBar resignFirstResponder];
}
- (IBAction)cancle:(id)sender {
    UIButton *btn = (UIButton*)sender;
    btn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)click1:(id)sender {
}

- (IBAction)click2:(id)sender {
}

- (IBAction)click3:(id)sender {
}
@end
