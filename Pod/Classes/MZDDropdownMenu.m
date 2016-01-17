//
//  MZDDropdownMenu.m
//  Pods
//
//  Created by lfeng on 16/1/17.
//
//

#import "MZDDropdownMenu.h"
#import "UIView+Extension.h"

@interface MZDDropdownMenu ()

@property (nonatomic, strong) UIImageView *containerView;

@end

@implementation MZDDropdownMenu

- (UIImageView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIImageView alloc] init];
        _containerView.image = [UIImage imageNamed:@"popover_background"];
        _containerView.userInteractionEnabled = YES;
        [self addSubview:_containerView];
    }
    return _containerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (instancetype)menu
{
    return [[self alloc] init];
}

- (void)setContent:(UIView *)content
{
    _content = content;
    
    content.x = 10;
    content.y = 15;
    
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    [self.containerView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    
    self.content = contentController.view;
}

- (void)showFrom:(UIView *)from
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
    
    self.frame = window.bounds;
    
    CGRect newFrame = [from convertRect:from.bounds toView:window];
    
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y = CGRectGetMaxY(newFrame);
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
}

- (void)dismiss
{
    [self removeFromSuperview];
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
