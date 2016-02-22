//
//  SafeDetailViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/3.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SafeDetailViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "ChangePhoneViewController.h"
@interface SafeDetailViewController ()<ABPeoplePickerNavigationControllerDelegate>
- (IBAction)address:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *phone;
- (IBAction)changePhone:(id)sender;

@end

@implementation SafeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"手机号";
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)address:(id)sender {
    
    Model(ABPeoplePickerNavigationController);
    //vc.peoplePickerDelegate = self;
}

//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person {
//    ABMutableMultiValueRef phoneMulti = ABRecordCopyValue(person, kABPersonPhoneProperty);
//    
//    
//    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    if (firstName==nil) {
//        firstName = @" ";
//    }
//    NSString *lastName=(__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
//    if (lastName==nil) {
//        lastName = @" ";
//    }
//    NSMutableArray *phones = [NSMutableArray arrayWithCapacity:0];
//    for (int i = 0; i < ABMultiValueGetCount(phoneMulti); i++) {
//        NSString *aPhone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phoneMulti, i);
//        [phones addObject:aPhone];
//    }
//    NSDictionary *dic = @{@"firstName": firstName,@"lastName":lastName,@"phones":phones};
//    
//    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
//}

- (IBAction)changePhone:(id)sender {
    Push(ChangePhoneViewController);
}
@end
