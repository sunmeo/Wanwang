//
//  ChaxunViewController.m
//  Wanwang
//
//  Created by keo on 11/28/12.
//  Copyright (c) 2012 keo. All rights reserved.
//

#import "ChaxunViewController.h"

#define ENGLISH @".com",@".cn",@".mobi",@".co",@".net",@".com.cn",@".net.cn",@".so",@".org",@".gov.cn",@".org.cn",@".tel",@".tv",@".biz",@".cc",@".hk",@".name",@".info",@".asia",@".me",nil
#define CHINA @".com",@".net",@".tv",@".biz",@".cc",@"公司",@"网络",@"中国",nil




@interface ChaxunViewController ()

@end

@implementation ChaxunViewController


@synthesize contentTopNavUIView;
@synthesize homepageButton;
@synthesize backButton;
@synthesize contentTitle;
@synthesize searchTextField;
@synthesize searchButton;
@synthesize zhongwenIV;
@synthesize yingwenIV;
@synthesize zhongwen;
@synthesize yingwen;
@synthesize domainSugTableView;
@synthesize dotX;





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
  
    
    UIImageView * bgIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"suffix_background.png"]];
    bgIV.frame = CGRectMake(0, 0, 320, 460);
    [self.view addSubview:bgIV];
    
    self.contentTopNavUIView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.contentTopNavUIView.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"topNavR.png"]];
    [self.view addSubview:self.contentTopNavUIView];

    
    
//    self.homepageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.homepageButton.frame = CGRectMake(270, 7, 50, 30);
//    [self.homepageButton setBackgroundImage:[UIImage imageNamed:@"title_home_normal.png"] forState:UIControlStateNormal];
//    [self.homepageButton addTarget:self action:@selector(backToHome) forControlEvents:UIControlEventTouchUpInside];
//    [self.contentTopNavUIView addSubview:self.homepageButton];

    self.homepageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.homepageButton.frame = CGRectMake(260, 7, 50, 30);
    [self.homepageButton setTitle:@"多域名" forState:UIControlStateNormal];
    [self.homepageButton setBackgroundImage:[UIImage imageNamed:@"widget_bg1.png"] forState:UIControlStateNormal];
    [self.homepageButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.homepageButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.homepageButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [self.contentTopNavUIView addSubview:self.homepageButton];
    

    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton.frame = CGRectMake(10, 7, 50, 30);
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"widget_bg1.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.backButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [self.contentTopNavUIView addSubview:self.backButton];
    
    
    self.contentTitle = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 220, 44)];
    self.contentTitle.text = @"域名查询";
    self.contentTitle.layer.shadowColor = [UIColor blackColor].CGColor;
    self.contentTitle.layer.shadowOffset = CGSizeMake(0, -1);
    self.contentTitle.layer.shadowOpacity = 1;
    self.contentTitle.textAlignment = NSTextAlignmentCenter;
    self.contentTitle.font = [UIFont boldSystemFontOfSize:18];
    self.contentTitle.textColor = [UIColor whiteColor];
    self.contentTitle.backgroundColor = [UIColor clearColor];
    [self.contentTopNavUIView addSubview:self.contentTitle];

    UIImageView * searchbg = [[UIImageView alloc]init];
    searchbg.frame = CGRectMake(0, 44, 320, 44);
    searchbg.userInteractionEnabled = YES;
    searchbg.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:searchbg];

    UIImageView * searchbgX = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbarXG.png"]];
    searchbgX.frame = CGRectMake(0, 4, 320, 36);
    searchbgX.userInteractionEnabled = YES;
    searchbgX.backgroundColor = [UIColor clearColor];
    [searchbg addSubview:searchbgX];

    self.searchTextField = [[UITextField alloc]init];
    self.searchTextField.frame = CGRectMake(15, 8+3, 245, 28+10);
    self.searchTextField.clearButtonMode = YES;
    self.searchTextField.backgroundColor = [UIColor clearColor];
    self.searchTextField.placeholder = @"请您输入英文域名:taobao/taobao.com";
    self.searchTextField.delegate = self;
    [searchbg addSubview:self.searchTextField];
    
    self.searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.searchButton.frame = CGRectMake(280, 44+12, 20, 20);
    self.searchButton.backgroundColor = [UIColor clearColor];
    [self.searchButton setBackgroundImage:[UIImage imageNamed:@"searchbar.png"] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchButton];
    
//    UIImageView * bibg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"domain_head.png"]];
    UIImageView * bibg = [[UIImageView alloc]init];
    bibg.frame = CGRectMake(0, 44+44, 320, 30);
    bibg.userInteractionEnabled = YES;
    bibg.backgroundColor = [[UIColor alloc]initWithRed:(225/255.0) green:(225/255.0) blue:(225/255.0) alpha:0.6];
    [self.view addSubview:bibg];

    self.zhongwen = [[UILabel alloc]init];
    zhongwen.frame = CGRectMake(150, 0, 50, 30);
    zhongwen.text = @"中文";
    zhongwen.font = [UIFont systemFontOfSize:13];
    zhongwen.textColor = [UIColor grayColor];
    zhongwen.backgroundColor = [UIColor clearColor];
    [bibg addSubview:zhongwen];
    
    self.yingwen = [[UILabel alloc]init];
    yingwen.frame = CGRectMake(50, 0, 50, 30);
    yingwen.text = @"英文";
    yingwen.font = [UIFont systemFontOfSize:13];
    yingwen.textColor = [UIColor blackColor];
    yingwen.backgroundColor = [UIColor clearColor];
    [bibg addSubview:yingwen];
    
    self.zhongwenIV = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zhongwenIV.frame = CGRectMake(120, 0, 30, 30);
    [zhongwenIV setBackgroundImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
    [zhongwenIV addTarget:self action:@selector(souZhongwen) forControlEvents:UIControlEventTouchUpInside];
    [bibg addSubview:zhongwenIV];

    self.yingwenIV = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yingwenIV.frame = CGRectMake(20, 0, 30, 30);
    [yingwenIV setBackgroundImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    [yingwenIV addTarget:self action:@selector(souYingwen) forControlEvents:UIControlEventTouchUpInside];
    [bibg addSubview:yingwenIV];
    
    self.domainSugTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44+44+30, 320, 460-44-44-30 ) style:UITableViewStylePlain];
    self.domainSugTableView.dataSource = self;
    self.domainSugTableView.delegate = self;
    self.domainSugTableView.hidden = YES;
    [self.view addSubview:self.domainSugTableView];

    
    self.dotX = [NSArray arrayWithObjects:ENGLISH];

    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell;
    static NSString * sugCell = @"Sug Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:sugCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sugCell];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString * adddot = [dotX objectAtIndex:indexPath.row];
//    if (!adddot) {
//        adddot = @"";
//    }
//    if (self.searchTextField.text == nil) {
//        self.searchTextField.text = @"";
//    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@",self.searchTextField.text,adddot];
        
    return cell;
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    self.domainSugTableView.hidden = NO;
//    [self.domainSugTableView reloadData];
//    
//    return YES;

    if (textField == self.searchTextField) {
        
        if ( self.searchTextField.text.length ) {
             self.domainSugTableView.hidden = YES;
            NSLog(@"boipi");
        }
        else {
            self.domainSugTableView.hidden = NO;
            [self.domainSugTableView reloadData];

        }

        
        
    }

     return YES;


}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.domainSugTableView.hidden = YES;

}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//  
//    return YES;
//}



-(void)souZhongwen
{
    [self.zhongwenIV setBackgroundImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    [self.yingwenIV setBackgroundImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
    self.searchTextField.placeholder = @"请您输入中文域名:万网/万网.com";
    zhongwen.textColor = [UIColor blackColor];
    yingwen.textColor = [UIColor grayColor];


}

-(void)souYingwen
{
    [self.yingwenIV setBackgroundImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    [self.zhongwenIV setBackgroundImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
    self.searchTextField.placeholder = @"请您输入英文域名:taobao/taobao.com";
    zhongwen.textColor = [UIColor grayColor];
    yingwen.textColor = [UIColor blackColor];
    
}







-(void)backAction
{
    [self dismissModalViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
