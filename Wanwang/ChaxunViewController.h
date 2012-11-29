//
//  ChaxunViewController.h
//  Wanwang
//
//  Created by keo on 11/28/12.
//  Copyright (c) 2012 keo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface ChaxunViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>



@property (retain,nonatomic) UIView * contentTopNavUIView;
@property (retain,nonatomic) UIButton * homepageButton;
@property (retain,nonatomic) UIButton * backButton;
@property (retain,nonatomic) UILabel * contentTitle;
@property (retain,nonatomic) UITextField * searchTextField;
@property (retain,nonatomic) UIButton * searchButton;
@property (retain,nonatomic) UIButton * zhongwenIV;
@property (retain,nonatomic) UIButton * yingwenIV;
@property (retain,nonatomic) UILabel * zhongwen;
@property (retain,nonatomic) UILabel * yingwen;
@property (retain,nonatomic) UITableView * domainSugTableView;
@property (retain,nonatomic) NSArray * dotX;



@end
