//
//  NVT_SubCell_CollectionViewCell.m
//  NVT_NestedCollectionView
//
//  Created by Nguyen Van Tu on 9/6/17.
//  Copyright © 2017 Nguyen Van Tu. All rights reserved.
//

#import "NVT_SubCell_CollectionViewCell.h"
#import "NVT_SubCell_Trending.h"
#import "NVT_SubCell_Discovery.h"
#import "NVT_SubView_StartTrend.h"
@implementation NVT_SubCell_CollectionViewCell
{
    PA_Treding_Model *_model;
}
@synthesize type = _type;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Ininonatomic, tialization code
}
- (void)setupDataToView:(PA_Treding_Model *)model
{
    _model = model;
}
- (void)removeSubViews
{
    for(UIView *subView in self.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
}
- (void)setType:(SubCellType)type
{
    [self removeSubViews];
    _type = type;
    switch (type) {
        case SubCell_Trending:
        {
            NVT_SubCell_Trending *trendingView = [[NVT_SubCell_Trending alloc] initWithFrame:self.frame];
            [trendingView setupDataToView:_model];
            [self addView:trendingView toView:self.contentView];
        }
        break;
        case SubCell_Discovery:
        {
            NVT_SubCell_Discovery *discoveryView = [[NVT_SubCell_Discovery alloc] initWithFrame:self.frame];
            [discoveryView setupDataToView:_model];
            [self addView:discoveryView toView:self.contentView];
        }
            break;
        default:
        {
            NVT_SubView_StartTrend *startTrendView = [[NVT_SubView_StartTrend alloc] initWithFrame:self.frame];
            [self addView:startTrendView toView:self.contentView];
        }
        break;
    }
}
- (SubCellType)type
{
    return _type;
}
- (void)addView:(UIView *)subView toView:(UIView *)mainView
{
    [mainView addSubview:subView];
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top= [NSLayoutConstraint
                              constraintWithItem:subView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:mainView
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint
                                  constraintWithItem:subView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:mainView
                                  attribute:NSLayoutAttributeBottom multiplier:1.0f
                                  constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint
                                constraintWithItem:subView
                                attribute:NSLayoutAttributeLeft
                                relatedBy:NSLayoutRelationEqual
                                toItem:mainView attribute:
                                NSLayoutAttributeLeft multiplier:1.0
                                constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint
                                 constraintWithItem:subView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:mainView attribute:
                                 NSLayoutAttributeRight multiplier:1.0
                                 constant:0];
    /* 4. Add the constraints to button's superview*/
    [self addConstraints:@[top, left, bottom, right]];
}
@end
