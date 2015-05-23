//
//  nearPeopleViewController.m
//  backplayer
//
//  Created by command.Zi on 15/1/22.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import "nearPeopleViewController.h"

@interface nearPeopleViewController () {
    
}

@property (nonatomic, assign) BOOL hasShowPickerView;
@property (strong, nonatomic) IBOutlet UIView *pickerContainerVIew;
- (IBAction)actionButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;

@end

@implementation nearPeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self replacePickerContainerViewTopConstraintWithConstant:self.view.frame.size.height];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)replacePickerContainerViewTopConstraintWithConstant:(CGFloat)constant
{
    for (NSLayoutConstraint *constraint in self.pickerContainerVIew.superview.constraints) {
        if (constraint.firstItem == self.pickerContainerVIew && constraint.firstAttribute == NSLayoutAttributeTop) {
            constraint.constant = constant;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionButton:(id)sender {
    self.hasShowPickerView = !self.hasShowPickerView;
    if (self.hasShowPickerView) {
        //初始化～
        //frame 相对于父View的坐标， bounds 相对于屏幕的坐标
        CGRect actionButtonFrame = self.actionButton.frame;
        //获取按钮在self.View中的frame
        actionButtonFrame = [self.view convertRect:actionButtonFrame fromView:self.actionButton.superview];
//        将按钮的frame的起点的y＋按钮的高得到actionButtonYOffset（得到的是按钮左下点距离窗口上边框的距离）
        CGFloat actionButtonYOffset = actionButtonFrame.origin.y+actionButtonFrame.size.height;
//        将actionButtonYOffset－（当前窗口View的高－包含pickerView的View高（得到））得到gap（缺口）
        CGFloat aa = self.pickerContainerVIew.frame.size.height;
        CGFloat bb = self.view.frame.size.height;
        NSLog(@"aa--%fbb--%fcc---%f",aa,bb,actionButtonYOffset);
        CGFloat gap = actionButtonYOffset - (self.view.frame.size.height - self.pickerContainerVIew.frame.size.height);
//        将窗口的起点赋给bounds
        CGRect bounds = self.view.bounds;
//        如果
//        if (gap > 0) {
//            bounds.origin.y = gap;
//        }else {
//            gap = 0;
//        }
        
        bounds.origin.y = gap;
        [self replacePickerContainerViewTopConstraintWithConstant:actionButtonYOffset];
        [UIView animateWithDuration:0.25 animations:^ {
            self.view.bounds = bounds;
            
//            [self.view layoutIfNeeded];
        }];
    }else {
        [self replacePickerContainerViewTopConstraintWithConstant:self.view.frame.size.height];
        CGRect bounds = self.view.bounds;
        bounds.origin.y = 0;
        [UIView animateWithDuration:0.25 animations:^ {
            self.view.bounds = bounds;
//            [self.view layoutIfNeeded];
        }];
    }
}
@end
