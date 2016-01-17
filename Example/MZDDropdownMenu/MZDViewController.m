//
//  MZDViewController.m
//  MZDDropdownMenu
//
//  Created by lifeng.zeng on 01/16/2016.
//  Copyright (c) 2016 lifeng.zeng. All rights reserved.
//

#import "MZDViewController.h"
#import "MZDDropdownMenu.h"
#import "UIView+Extension.h"
#import "MZDTitleMenuViewController.h"

@interface MZDViewController ()

@end

@implementation MZDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    redButton.width = 100;
    redButton.height = 50;
    redButton.x = 100;
    redButton.y = 100;
    redButton.backgroundColor = [UIColor redColor];
    [redButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(UIButton *)sender
{
    MZDDropdownMenu *menu = [MZDDropdownMenu menu];
    menu.delegate = self;
    
    MZDTitleMenuViewController *vc = [[MZDTitleMenuViewController alloc] init];
    vc.view.height = 150;
    vc.view.width = 150;
    menu.contentController = vc;
    
    [menu showFrom:sender];
}

#pragma mark - LFDropdownDelegate
- (void)dropdownMenuDidShow:(MZDDropdownMenu *)menu
{
    
}

- (void)dropdownMenuDidDismiss:(MZDDropdownMenu *)menu
{
    
}

@end
