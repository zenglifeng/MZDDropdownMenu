//
//  MZDDropdownMenu.h
//  Pods
//
//  Created by lfeng on 16/1/17.
//
//

#import <UIKit/UIKit.h>

@class MZDDropdownMenu;

@protocol MZDDropdownMenuDelegate <NSObject>

@optional
- (void)dropdownMenuDidDismiss:(MZDDropdownMenu *)menu;
- (void)dropdownMenuDidShow:(MZDDropdownMenu *)menu;

@end

@interface MZDDropdownMenu : UIView

@property (nonatomic, weak) id <MZDDropdownMenuDelegate> delegate;
@property (nonatomic, strong) UIView *content;
@property (nonatomic, strong) UIViewController *contentController;

+ (instancetype)menu;

- (void)showFrom:(UIView *)from;
- (void)dismiss;

@end
