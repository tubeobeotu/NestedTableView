//
//  BaseSubView.h
//  SmartOffice
//
//  Created by NguyenVanTu on 5/5/17.
//  Copyright © 2017 Nguyen Thanh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PA_Treding_Model.h"
@interface NVT_BaseSubView : UIView
@property (nonatomic, strong) UIView *view;
- (void)setupDataToView:(PA_Treding_Model *)model;
@end
