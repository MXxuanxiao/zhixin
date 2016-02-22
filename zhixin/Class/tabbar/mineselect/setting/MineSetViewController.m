//
//  MineSetViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/1.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "MineSetViewController.h"
#import <sys/types.h>
#include <sys/sysctl.h>
#import <UIImageView+WebCache.h>
@interface MineSetViewController () <UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate>
- (IBAction)didSelect:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UITextField *occupation;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UILabel *NowAddress;
@property (weak, nonatomic) IBOutlet UILabel *OldAddress;
@property (weak, nonatomic) IBOutlet UITextField *reasons;
@property (weak, nonatomic) IBOutlet UITextField *mail;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSMutableArray *dataArray1;
@property (strong, nonatomic) NSMutableArray *dataArray2;
@property (nonatomic, assign) NSInteger flag;
@property (nonatomic, assign) CGPoint oldCenter;
@property (nonatomic, assign) CGPoint pickerCenter;

@end

@implementation MineSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ((UIScrollView*)self.view).contentSize = CGSizeMake(0, 750);
    ((UIScrollView*)self.view).delegate = self;
    ((UIScrollView*)self.view).showsVerticalScrollIndicator = NO;
    _oldCenter                = self.view.center;
    self.data                 = [NSMutableArray array];
    self.dataArray1           = [NSMutableArray array];
    self.dataArray2           = [NSMutableArray array];
    self.navigationItem.title = @"个人设置";
    // Do any additional setup after loading the view from its nib.
    //self.tableView.delegate = self;
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] valueForKey:kUserInfo];
    self.name.text = [dict valueForKey:kUserName];
    [self.icon sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:kUserIcon]] placeholderImage:[UIImage imageNamed:@"icon120_120"]];
    [self createSaveBtn];
    [self createpickerView];
    [self creatrTap];
    //
    [Help keyBoardDownWithController:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardDown:) name:UITextFieldTextDidEndEditingNotification object:nil];
    //键盘隐藏时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHid) name:UIKeyboardWillHideNotification object:nil];
    //键盘弹出时
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    

}

/**
 *  键盘隐藏
 */
- (void)keyBoardWillHid {
    NG(@"键盘隐藏");
}
/**
 *  键盘弹出
 */
- (void)keyBoardWillShow:(id)sender {
    self.pickerView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//键盘消失
- (void)keyBoardDown:(id)sender {
    self.pickerView.hidden = YES;
    [self.name resignFirstResponder];
    [self.occupation resignFirstResponder];
    [self.company resignFirstResponder];
    [self.reasons resignFirstResponder];
    [self.mail resignFirstResponder];
}

- (void)createSaveBtn {
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = save;
    self.navigationItem.rightBarButtonItem.tintColor = kWhite;
}
#pragma mark --SaveButton
- (void)save:(id)sender {
    NG(@"保存");
}
- (IBAction)didSelect:(id)sender {
    [self keyBoardDown:nil];
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag-100) {
        case 0: {
            UIAlertController *sheet = [UIAlertController alertControllerWithTitle:nil message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [sheet addAction:cancle];
            UIAlertAction * camera = [UIAlertAction actionWithTitle:@"拍照 " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NG(@"1");
                [self opencamera];
            }];
            [sheet addAction:camera];
            
            UIAlertAction *album = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NG(@"1");
                [self openPhotoLibrary];
            }];
            [sheet addAction:album];
            [self presentViewController:sheet animated:YES completion:nil];
        }
            break;
        case 1: {
            self.pickerView.hidden = NO;
            _flag = 100;
            [self.data removeAllObjects];
            self.dataArray1 = [NSMutableArray arrayWithArray:@[@"男",@"女"]];
            [self.data addObject:self.dataArray1];
            [self.pickerView reloadAllComponents];
            
        }
            break;
        case 2: {
            self.pickerView.hidden = NO;
            _flag = 200;
            [self.data removeAllObjects];
            self.dataArray1 = [NSMutableArray arrayWithArray:@[@"北京",@"山东"]];
            [self.data addObject:self.dataArray1];
            [self.pickerView reloadAllComponents];
        }
            break;
        default: {
            self.pickerView.hidden = NO;
            _flag = 300;
            [self.data removeAllObjects];
            self.dataArray1 = [NSMutableArray arrayWithArray:@[@"北京",@"山东"]];
            [self.data addObject:self.dataArray1];
            [self.pickerView reloadAllComponents];
        }
            break;
    }
}

- (NSAttributedString*)attWithString:(NSString *)string {
    NSAttributedString *attStr = [[NSAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName: [UIColor blueColor]}];
    return attStr;
}
- (void)creatrTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}
- (void)tap:(id)sender {
    self.pickerView.hidden = YES;
}
#pragma mark --picker
- (void)createpickerView {
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, kHeight/3*2, kWidth, kHeight/3-50)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.tintColor = [UIColor blueColor];
    self.pickerView.backgroundColor = [UIColor colorWithRed:0.792 green:0.914 blue:0.949 alpha:1.000];
    [self.view addSubview:self.pickerView];
    self.pickerView.hidden = YES;
    _pickerCenter = self.pickerView.center;
}
//pickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.data.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.dataArray1.count;
    }
    return self.dataArray2.count;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.dataArray1 objectAtIndex:row];
    }else {
        return [self.dataArray2 objectAtIndex:row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_flag == 100) {
        self.sex.text = [self.dataArray1 objectAtIndex:row];
    }else if (_flag == 200) {
        self.NowAddress.text = SF(@"%@", [self.dataArray1 objectAtIndex:row]);
    }else if (_flag == 300) {
        self.OldAddress.text = SF(@"%@", [self.dataArray1 objectAtIndex:row]);
    }
   
}

- (IBAction)company:(id)sender {

}
#pragma mark --imagePicker
//打开相机
- (void)opencamera {
    UIImagePickerControllerSourceType sourceType= UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else {
        [Help warning:@"该设备不支持照相功能"];
    }
}
//打开相册
- (void)openPhotoLibrary {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
}
//delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        [self performSelector:@selector(saveImage:)  withObject:img afterDelay:0.5];
    }
    //    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(UIImage *)image {
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
    NSLog(@"imageFile->>%@",imageFilePath);
    success = [fileManager fileExistsAtPath:imageFilePath];
    if(success) {
        success = [fileManager removeItemAtPath:imageFilePath error:&error];
    }
    UIImage *smallImage = [self thumbnailWithImageWithoutScale:image size:CGSizeMake(80, 80 )];
    [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:imageFilePath atomically:YES];//写入文件
    UIImage *selfPhoto = [UIImage imageWithContentsOfFile:imageFilePath];//读取图片文件
    self.icon.image = selfPhoto;
}

// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}
#pragma mark UIscrollViewdelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat HI = scrollView.contentOffset.y;
    self.pickerView.center = CGPointMake(_pickerCenter.x, _pickerCenter.y+HI);
}
@end
